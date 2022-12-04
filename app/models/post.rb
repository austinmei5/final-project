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
end
