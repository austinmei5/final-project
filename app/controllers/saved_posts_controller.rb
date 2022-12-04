class SavedPostsController < ApplicationController
  def index
    matching_saved_posts = SavedPost.all

    @list_of_saved_posts = matching_saved_posts.order({ :created_at => :desc })

    render({ :template => "saved_posts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_saved_posts = SavedPost.where({ :id => the_id })

    @the_saved_post = matching_saved_posts.at(0)

    render({ :template => "saved_posts/show.html.erb" })
  end

  def create
    the_saved_post = SavedPost.new
    the_saved_post.user_id = params.fetch("query_user_id")
    the_saved_post.post_id = params.fetch("query_post_id")

    if the_saved_post.valid?
      the_saved_post.save
      redirect_to("/saved_posts", { :notice => "Saved post created successfully." })
    else
      redirect_to("/saved_posts", { :alert => the_saved_post.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_saved_post = SavedPost.where({ :id => the_id }).at(0)

    the_saved_post.user_id = params.fetch("query_user_id")
    the_saved_post.post_id = params.fetch("query_post_id")

    if the_saved_post.valid?
      the_saved_post.save
      redirect_to("/saved_posts/#{the_saved_post.id}", { :notice => "Saved post updated successfully."} )
    else
      redirect_to("/saved_posts/#{the_saved_post.id}", { :alert => the_saved_post.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_saved_post = SavedPost.where({ :id => the_id }).at(0)

    the_saved_post.destroy

    redirect_to("/saved_posts", { :notice => "Saved post deleted successfully."} )
  end
end
