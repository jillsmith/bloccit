include RandomData

#See Users
5.times do
    user = User.create!(
        name: RandomData.random_name,
        email: RandomData.random_email,
        password: RandomData.random_sentence
    )
end
        

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
    Post.create!(
        user: users.sample,
        topic: topics.sample,
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph)
    end
posts = Post.all

#Seed comments
100.times do
    Comment.create!(
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

 user = User.first
 user.update_attributes!(
   email:"jillma.smith@gmail.com",
   password: "helloworld"
 )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created" 
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} advertisements created" 
puts "#{Question.count} questions created"
puts "#{SponsoredPost.count} sponsored posts created" 


 

    


