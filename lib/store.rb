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
