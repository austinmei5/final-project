class PostsController < ApplicationController
  def index
    matching_posts = Post.all

    @list_of_posts = matching_posts.order({ :created_at => :desc })

    render({ :template => "posts/index.html.erb" })
  end

  def sort_by
    sort = params.fetch("path_id")

    the_category = Category.where(:name => sort).at(0).id
    @list_of_posts = Post.where(:category_id => the_category)

    render({ :template => "posts/sort.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_posts = Post.where({ :id => the_id })

    @the_post = matching_posts.at(0)

    @list_of_comments = Comment.where(:post_id => the_id).order(:created_at => :desc)

    render({ :template => "posts/show.html.erb" })
  end

  def create_landing_page
    render({ :template => "posts/create_post.html.erb" })
  end

  def create
    the_post = Post.new
    the_post.author_id = params.fetch("query_author_id")
    the_post.title = params.fetch("query_title")
    the_post.description = params.fetch("query_description")
    the_post.active_status = true
    the_post.category_id = params.fetch("query_category")

    if the_post.valid?
      the_post.save
      redirect_to("/posts/#{the_post.id}", { :notice => "Post created successfully." })
    else
      redirect_to("/create_post", { :alert => the_post.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_post = Post.where({ :id => the_id }).at(0)

    the_post.author_id = params.fetch("query_author_id")
    the_post.title = params.fetch("query_title")
    the_post.description = params.fetch("query_description")
    the_post.active_status = params.fetch("query_active_status", false)
    the_post.category_id = params.fetch("query_category")

    if the_post.valid?
      the_post.save
      redirect_to("/posts/#{the_post.id}", { :notice => "Post updated successfully." })
    else
      redirect_to("/posts/#{the_post.id}", { :alert => the_post.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_post = Post.where({ :id => the_id }).at(0)

    if session.fetch(:user_id) == the_post.author.id
      the_post.destroy
      redirect_to("/posts", { :notice => "Post deleted successfully." })
    else
      redirect_to("/", { :alert => "You do not have permission to do this." })
    end
  end

  def show_my_posts
    the_user_id = session.fetch(:user_id)
    @my_posts = Post.where(:author_id => the_user_id)

    render({ :template => "posts/my_posts.html.erb" })
  end

  def edit
    the_id = params.fetch("path_id")
    @the_post = Post.where({ :id => the_id }).at(0)

    if session.fetch(:user_id) == @the_post.author.id
      render({ :template => "posts/edit_post.html.erb" })
    else
      redirect_to("/", { :alert => "You do not have permission to do this." })
    end
  end
end
