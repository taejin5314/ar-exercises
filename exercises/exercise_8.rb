require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'
require_relative './exercise_7'

puts "Exercise 8"
puts "----------"

class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, numericality: { only_integer: true, greater_than: 39, less_than: 201}
  validates :store, presence: true

  private
    before_create do
      initial_map = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
      random_string = (0..8).map { initial_map[rand(initial_map.length)]}.join
      self.password = random_string
    end

end


@store1.employees.create(first_name: "Jo", last_name: "Shark", hourly_rate: 40)

@employee_new = Employee.where("first_name = ? AND last_name = ?", "Jo", "Shark")

@employee_new.each do |employee|
  p "First Name: #{employee.first_name}, Last Name: #{employee.last_name}, PASSWORD: #{employee.password}"
end
