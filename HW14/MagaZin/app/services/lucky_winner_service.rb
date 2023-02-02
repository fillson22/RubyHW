class LuckyWinnerService

  def call
    orders_month = Order.where("created_at >= ?", 1.week.ago.utc)
    orders_paid = orders_month.where(:status => 'paid')
    orders_paid.each do |order|
      u_user << order.user
    end
    lucky_users = u_user.sample(2)
    lucky_users.each do |user|
      SaleMailer.lucky_user(user).deliver_later
    end
  end

end