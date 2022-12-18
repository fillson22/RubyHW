module OrderableByTimestamp
  extend ActiveSupport::Concern

  included do
    scope :recently_create, -> { order(created_at: :desc) }
  end
end
