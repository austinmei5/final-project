Rails.application.routes.draw do

  # Routes for the Category resource:

  # CREATE
  # post("/insert_category", { :controller => "categories", :action => "create" })

  # READ
  get("/categories", { :controller => "categories", :action => "index" })

  # get("/categories/:path_id", { :controller => "categories", :action => "show" })

  # UPDATE

  # post("/modify_category/:path_id", { :controller => "categories", :action => "update" })

  # DELETE
  # get("/delete_category/:path_id", { :controller => "categories", :action => "destroy" })

  #------------------------------

  # Home
  get("/", { :controller => "posts", :action => "index" })

  # Routes for the Saved post resource:

  # ADD A SAVED POST
  get("/save_post/:path_id", { :controller => "saved_posts", :action => "create" })

  # CREATE
  # post("/insert_saved_post", { :controller => "saved_posts", :action => "create" })

  # READ
  get("/saved_posts", { :controller => "saved_posts", :action => "index" })

  get("/saved_posts/:path_id", { :controller => "saved_posts", :action => "show" })

  # UPDATE

  # post("/modify_saved_post/:path_id", { :controller => "saved_posts", :action => "update" })

  # DELETE
  get("/delete_saved_post/:path_id", { :controller => "saved_posts", :action => "destroy" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })

  # READ
  get("/comments", { :controller => "comments", :action => "index" })

  get("/comments/:path_id", { :controller => "comments", :action => "show" })

  # UPDATE

  # post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })

  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Post resource:

  # CREATE
  get("/create_post", { :controller => "posts", :action => "create_landing_page" })

  post("/create", { :controller => "posts", :action => "create" })

  # READ
  get("/posts", { :controller => "posts", :action => "index" })

  get("/posts/:path_id", { :controller => "posts", :action => "show" })

  get("/my_posts", { :controller => "posts", :action => "show_my_posts" })

  # UPDATE

  get("/edit_post/:path_id", { :controller => "posts", :action => "edit" })

  post("/modify_post/:path_id", { :controller => "posts", :action => "update" })

  # DELETE
  get("/delete_post/:path_id", { :controller => "posts", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  get("/users/:path_id", { :controller => "users", :action => "show" })

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create" })

  # EDIT PROFILE FORM
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })

  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })

  # SIGN OUT
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })

  #------------------------------

end
