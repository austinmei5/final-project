class UsersController < ApplicationController
  def show
    the_id = params.fetch("path_id")
    @the_user = User.where({ :id => the_id }).at(0)
    @list_of_users_posts = Post.where({ :author_id => the_id })

    render({ :template => "users/show.html.erb" })
  end
end
