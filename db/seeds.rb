include RandomData

#See Users
5.times do
    user = User.create!(
        name: RandomData.random_name,
        email: RandomData.random_email,
        password: RandomData.random_sentence
    )
end
    
users = User.all    

#Seed Topics
15.times do
   Topic.create!(
     name: RandomData.random_sentence,
     description: RandomData.random_paragraph
   )
end
topics = Topic.all

#Seed Post
50.times do
    post = Post.create!(
        user: users.sample,
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph)
        
        post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
        rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
    end
posts = Post.all

#Seed comments
100.times do
    Comment.create!(
        user: users.sample,
        post: posts.sample,
        body: RandomData.random_paragraph
        )
    end
    
puts "#{Post.count}"    
    
Post.find_or_create_by(title: "A unique title", body: "A unique body")

puts "#{Post.count}"

#Seed Advertisement
50.times do
    Advertisement.create!(
        title: RandomData.random_sentence,
        copy: RandomData.random_paragraph,
        price: RandomData.random_number)
    end
advertisements = Advertisement.all

#Seed Question
true_or_false = [true, false]
50.times do 
  Question.create!( 
      title: RandomData.random_sentence, 
      body: RandomData.random_paragraph, 
      resolved: true_or_false.sample)
end
questions = Question.all

#Seed SponosredPost
50.times do
    SponsoredPost.create!(
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        price: RandomData.random_number)
    end
sponsoredposts = SponsoredPost.all

#Create aadmin user
admin = User.create!(
    name:     'Admin User',
    email:    'admin@example.com',
    password: 'helloworld',
    role:     'admin'
)

# Create a member
member = User.create!(
    name:     'Member User',
    email:    'member@example.com',
    password: 'helloworld'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created" 
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created" 
puts "#{Question.count} questions created"
puts "#{SponsoredPost.count} sponsored posts created" 
puts "#{Vote.count} votes created"


 

    


