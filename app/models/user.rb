class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :send_signup_notification

  def admin?
    self == User.first
  end

  private

    def send_signup_notification
      UserMailer.signup_notification(self).deliver
    end

end
