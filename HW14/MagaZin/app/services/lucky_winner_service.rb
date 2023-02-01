class LuckyWinnerService
  

  
    # puts "Hi #{user.sample.email}"
    users = User.all
    orders = Order.
    user = user.sample

    users.each do |user|
      SaleMailer.lucky_user(user).deliver_later
    end
    


end