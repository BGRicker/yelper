class NotificationMailer < ActionMailer::Base
  default from: "no-reply@nomster.com"

	def comment_added(comment)
		@place = comment.place
		@place_owner = @place.user
  	mail(to: @place_owner.email,
  		subject: "A comment has been added to #{@place.name}.")
	end

	def sign_up(user)
		@created = user.created_at
		mail(to: user.email,
			subject: "Welcome to the site!")
	end

end