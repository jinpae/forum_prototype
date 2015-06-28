# == Schema Information
#
# Table name: forum_threads
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  subject    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_forum_threads_on_user_id  (user_id)
#

class ForumThread < ActiveRecord::Base
  belongs_to :user
	has_many :forum_posts
	has_many :users, through: :forum_posts

	accepts_nested_attributes_for :forum_posts

	validates :subject, presence: true
	validates_associated :forum_posts
end
