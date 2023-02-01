require 'sidekiq-scheduler'

class SaleWorker
  include Sidekiq::Worker

  def perform
    LuckyWinnerService.new().call
  end
end
