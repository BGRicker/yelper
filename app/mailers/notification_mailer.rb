class NotificationMailer < ActionMailer::Base
  default from: "no-reply@nomster.com"

	def comment_added
  	mail(to: "bgricker@gmail.com",
  		subkect: "A comment has been added to your place")
	end
end
