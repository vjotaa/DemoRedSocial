# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text(65535)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :user
end
