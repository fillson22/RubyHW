# frozen_string_literal: true

class LuckyWinnerService
  attr_reader :lottery_winners

  def initialize(lottery_winners)
    @lottery_winners = lottery_winners
  end

  def call
    orders_month = Order.where('created_at >= ?', 1.week.ago.utc)
    orders_paid = orders_month.where(status: 'paid')
    u_user = []
    orders_paid.each do |order|
      u_user << order.user
    end
    lucky_users = u_user.uniq.sample(2)
    lucky_users.each do |user|
      SaleMailer.lucky_user(user).deliver_later
    end
  end
end
