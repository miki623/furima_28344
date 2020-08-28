class Transaction < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :deal
  belongs_to_active_hash :shipping_area

end
