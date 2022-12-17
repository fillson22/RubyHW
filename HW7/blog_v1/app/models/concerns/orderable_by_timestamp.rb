module OrderableByTimestamp
  extend ActiveSupport::Concern

  included do
    scope :recently_created, -> { order(created_at: :desc) }
  end
end
