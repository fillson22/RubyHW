require 'sidekiq-scheduler'

class SaleWorker
  include Sidekiq::Worker

  def perform
    LuckyWinnerService.call
  end
end
