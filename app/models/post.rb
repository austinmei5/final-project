# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  active_status :boolean
#  category      :string
#  description   :string
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  author_id     :integer
#
class Post < ApplicationRecord
  belongs_to(:author, { :required => true, :class_name => "User", :foreign_key => "author_id" })

  has_many(:comments, { :class_name => "Comment", :foreign_key => "post_id", :dependent => :destroy })

  has_many(:saved_posts, { :class_name => "SavedPost", :foreign_key => "post_id", :dependent => :destroy })
end
