desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment }) do
  require "faker"

  User.destroy_all
  Post.destroy_all

  25.times do
    user = User.new
    user.username = Faker::Name.first_name
    user.email = user.username + "@gmail.com"
    user.password = "password"
    user.admin = false
    user.save
  end

  categories = ["Apartments", "Roommates", "Books", "Classes", "For Sale", "Other"]

  25.times do
    post = Post.new
    post.author_id = User.all.sample.id
    post.title = "Sample Title"
    post.description = "Sample Text"
    post.category = categories.sample
    post.active_status = true
    post.save
  end

  p "Added #{User.count} Users"
  p "added #{Post.count} Listings"
end
