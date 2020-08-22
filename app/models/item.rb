class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :name, length: { maximum: 40}
    validates :info, length: { maximum: 1000 }
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
end
