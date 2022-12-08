# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  admin            :boolean
#  email            :string
#  facebook_account :string
#  password_digest  :string
#  username         :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  validates(:username, { :uniqueness => true })
  # validates(:facebook_account, { :uniqueness => { :message => "this Facebook account is already registered" } })
  has_secure_password

  has_many(:posts, { :class_name => "Post", :foreign_key => "author_id", :dependent => :destroy })

  has_many(:comments, { :class_name => "Comment", :foreign_key => "commenter_id", :dependent => :destroy })

  has_many(:saved_posts, { :class_name => "SavedPost", :foreign_key => "user_id", :dependent => :destroy })

  
end
