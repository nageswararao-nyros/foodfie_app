class DishAffection < ActiveRecord::Base
  belongs_to :favouriter, :class_name => 'User'
  belongs_to :dish
end
