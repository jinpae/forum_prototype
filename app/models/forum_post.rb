# == Schema Information
#
# Table name: forum_posts
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  forum_thread_id :integer
#  body            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_forum_posts_on_forum_thread_id  (forum_thread_id)
#  index_forum_posts_on_user_id          (user_id)
#

class ForumPost < ActiveRecord::Base
  belongs_to :user
  belongs_to :forum_thread

	validates :body, presence: true

	def send_notifications
		users = forum_thread.users.uniq - [user]

		users.each do |user|
			# If there's a background worker, then send later;
			# otherwise send immediately.
			NotificationMailer.forum_post_notification(user, self).deliver_later
		end
	end
end
