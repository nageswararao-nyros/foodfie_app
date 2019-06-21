class RestaurantAffection < ActiveRecord::Base
  belongs_to :favouriter, :class_name => 'User'
  belongs_to :restaurant
end
