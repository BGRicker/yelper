class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :places
  has_many :comments
  after_create :sign_up_email


  	def sign_up_email
		    NotificationMailer.new_user(self).deliver
	  end

    def tough_customer
        Comment.where(:user_id => self.id).average(:rating).to_i
    end
    def neg_tough_customer
        (tough_customer-5).abs
    end

end