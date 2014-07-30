class NotificationMailer < ActionMailer::Base
  default from: "no-reply@nomster.com"

	def comment_added(comment)
		@place = comment.place
		@place_owner = @place.user
		@place_update = @place.updated_at
  	mail(to: @place_owner.email,
  		subject: "A comment has been added to #{@place.name}.")
	end

	def sign_up(user)
		@email_add = user.email
		mail(to: user.email,
			subject: "Welcome to the site!")
	end

end