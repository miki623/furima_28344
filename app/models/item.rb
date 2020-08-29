class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one_attached :image, dependent: :destroy
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :scheduled_delivery
  has_one :deal


  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40}
    validates :info, length: { maximum: 1000 }
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :category
    validates :sales_status 
    validates :delivery_fee
    validates :shipping_area
    validates :scheduled_delivery
  end
end
