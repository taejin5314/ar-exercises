require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...

class Store < ActiveRecord::Base
  has_many :employees
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :carry_one_of_apparel

  def carry_one_of_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:mens_apparel, "can't be empty")
    end
  end

end

class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than: 39, less_than: 201}
  validates :store, presence: true

end

@toronto = Store.create(name: "Toronto")
@toronto.errors.messages.each { |n| puts "#{n}"}