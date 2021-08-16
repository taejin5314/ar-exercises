require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'
require_relative './exercise_7'
require_relative './exercise_8'

puts "Exercise 9"
puts "----------"

class Store < ActiveRecord::Base
  has_many :employees
  validates :name, :annual_revenue, :mens_apparel, :womens_apparel, presence: true
  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :carry_one_of_apparel

  def carry_one_of_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:mens_apparel, "can't be empty")
    end
  end

  private
    before_destroy do
      if self.employees.size < 1
        self.destroy
      else
        errors.add(:base, 'something bad happened')
        raise ActiveRecord::RecordInvalid, self
      end
    end

end


@store1 = Store.find(1)
if @store1.destroy
  puts "Store destroyed! It has #{@store1.employees.size} =/"
else
  puts "Could not destroy store :)"
end

# Make sure empty stores can be destroyed
@empty_store = Store.create!(name: 'Test Empty Store', annual_revenue: 0, mens_apparel: true)
if @empty_store.destroy
  puts "Empty Store destroyed! This is good"
else
  puts "Whoa! Empty store should be destroyable... Not cool!"
end