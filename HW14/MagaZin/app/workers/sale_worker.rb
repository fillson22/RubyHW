require 'sidekiq-scheduler'

class SaleWorker
  include Sidekiq::Worker

  def perform
    LuckyWinnerService.new(lottery_winners: 'Lucky').call
  end
end
