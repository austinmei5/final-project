desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment }) do
  require "faker"

  User.destroy_all
  Post.destroy_all
  Comment.destroy_all
  SavedPost.destroy_all
  Category.destroy_all

  50.times do
    user = User.new
    user.username = Faker::Name.first_name
    user.email = user.username + "@gmail.com"
    user.password = "password"
    user.admin = false
    user.save
  end

  user = User.new
  user.username = "Austin"
  user.email = "austinmei@uchicago.edu"
  user.password = "password"
  user.facebook_account = "https://www.facebook.com/austin.mei.501"
  user.admin = true
  user.save

  categories = ["Apartments", "Roommates", "Books", "Classes", "For Sale", "Other"]

  categories.each do |a_category|
    cat = Category.new
    cat.name = a_category
    cat.save
  end

  50.times do
    post = Post.new
    post.active_status = true
    post.author_id = User.all.sample.id
    post.category_id = Category.all.sample.id

    if post.category.name == "Apartments"
      post.title = "Apartment Passdown"
      post.description = "Hi everyone, I'm a graduating 4th-year and I'm looking to pass down my apartment. It's a 3bd 1ba on 55th and Dorchester (About 10 mins from campus). The monthly rent is $2150. Msg me on FB if interested!"
    
    elsif post.category.name == "Roommates"
      post.title = "Looking for a roommate"
      post.description = "Hey guys, my current roommates and I are looking for a 4th roommate for a 4bd apartment we found for next year. Comment below if you're looking for housing!"
    
    elsif post.category.name == "Books"
      post.title = Faker::Book.title
      post.description = "Hi everyone, I'm looking for a copy of #{post.title} for one of my classes. Let me know if you're willing to sell a copy"
    
    elsif post.category.name == "Classes"
      post.title = "App Dev Study Group"
      post.description = "Hey, I'm in App Dev next quarter. Add me on Facebook if you'd like to form a study group!"
    
    elsif post.category.name == "For Sale"
      objects = ["Couch", "Nightstand", "Lamp", "Desk", "Office Chair", "Table", "TV"]
      for_sale = objects.sample
      post.title = "Selling " + for_sale
      post.description = "Hi, I'm looking to sell my #{for_sale}. Message me on Facebook for more details"
    
    else
      post.title = "Chuck Norris Facts"
      post.description = Faker::ChuckNorris.fact
    end 
  
    post.save
  end

  75.times do 
    comment = Comment.new
    comment.commenter_id = User.all.sample.id
    comment.post_id = Post.all.sample.id
    comment.comment_text = Faker::Quote.famous_last_words
    comment.save
  end

  

  p "Added #{User.count} Users"
  p "Added #{Post.count} Listings"
  p "Added #{Comment.count} Comments"

end
