class Subscription < ActiveRecord::Base
  validates :endpoint, uniqueness: true
end
