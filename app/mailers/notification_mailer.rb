class NotificationMailer < ApplicationMailer
	default from: "notifications@example.com"

	def forum_post_notification(user, forum_post)
		@user = user
		@forum_post = forum_post

		mail(
			to: user.email,
			subject: "[Forum] New post in #{forum_post.forum_thread.subject}"
		)
	end
end
