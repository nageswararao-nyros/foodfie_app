class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :dish

  validates :user_id, :dish_id, :weight, presence: true
  validates :weight, numericality: {
                       only_float: true,
                       greater_than_or_equal_to: 0,
                       less_than_or_equal_to: 10
                     }
  validate :check_weight_value

  private

  def check_weight_value
    unless weight % 0.5 == 0
      errors.add(:weight, "must be in multiples of 0.5")
    end
  end
end
