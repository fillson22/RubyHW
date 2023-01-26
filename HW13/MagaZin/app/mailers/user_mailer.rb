class UserMailer < ApplicationMailer
  def thanks_for_order(user, order)
    @user = user
    @order = order
    #attachments['file-name.jpg'] = File.read('file-name.jpg')
    mail(to: @user.email, subject: 'Thanks for the order | MagaZin')
  end
end
