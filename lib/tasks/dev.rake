desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment }) do
  require "faker"

  User.destroy_all
  Listing.destroy_all

  25.times do
    user = User.new
    user.username = Faker::Name.first_name
    user.email = user.username + "@gmail.com"
    user.password = "password"
    user.listings_count = 0
    user.admin = false
    user.save
  end

  25.times do
    list = Listing.new
    list.active_status = true
    list.user_id = User.all.sample.id
    list.description = "Sample Text"
    list.title = "Sample Title"
    list.save
  end

  list_of_categories = ["Apartments", "Roommates", "Books", "Classes", "For Sale", "Misc"]

  Listing.all.each do |a_listing|
    cat = Category.new
    cat.listing_id = a_listing.id
    cat.category = list_of_categories.sample
    cat.save
  end

  p "Added #{User.count} Users"
  p "added #{Listing.count} Listings"
end
