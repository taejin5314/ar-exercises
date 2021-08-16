require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.employees.create(first_name: "Athena", last_name: "Spear", hourly_rate: 40)
@store1.employees.create(first_name: "Abram", last_name: "Sing", hourly_rate: 45)
@store2.employees.create(first_name: "Moses", last_name: "Egypt", hourly_rate: 35)
@store2.employees.create(first_name: "Deep", last_name: "Sleep", hourly_rate: 50)
@store2.employees.create(first_name: "Shrimp", last_name: "King", hourly_rate: 20)