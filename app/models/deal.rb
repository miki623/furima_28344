class Deal < ApplicationRecord
  has_many :users
  belongs_to :item
end
