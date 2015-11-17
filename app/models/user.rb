class User < ActiveRecord::Base

   has_many :posts, dependent: :destroy
   has_many :comments, dependent: :destroy
   has_many :votes, dependent: :destroy
    
    before_save { self.email = email.downcase }
    before_save { self.role ||= :member }
    before_save :format_name
   
    
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :name, length: { minimum: 1, maximum: 100 }, presence: true
    validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
    validates :password, length: { minimum: 6 }, allow_blank: true
    
    validates :email,
        presence: true,
        uniqueness: { case_sensitive: false },
        length: { minimum: 3, maximum: 100 },
        format: { with: EMAIL_REGEX }
    
    has_secure_password
    
    enum role: [:member, :admin, :moderator]
    
    def format_name
       if name
           name_array = []
           name.split.each do |name_part|
               name_array << name_part.capitalize
           end
           self.name = name_array.join(" ")
       end
    end
    
    def self.avatar_url(user, size)
        gravatar_id = Digest::MD5::hexdigest(user.email).downcase
        "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    end
    
end
