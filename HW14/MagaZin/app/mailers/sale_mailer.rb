class SaleMailer < ApplicationMailer
  def lucky_user(user)
    mail(to: user.email, subject: 'You lucky because we give you sale 50% | MagaZin')
  end
end