# == Schema Information
#
# Table name: saved_posts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#  user_id    :integer
#
class SavedPost < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:post, { :required => true, :class_name => "Post", :foreign_key => "post_id" })
end
