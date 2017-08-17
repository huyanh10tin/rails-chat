class PostMailer < ApplicationMailer
  def new_post
    @greeting = "Hi"

    mail to: @user.email
  end
end
