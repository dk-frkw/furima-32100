class Item < ApplicationRecord

  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :delivery_area_id, presence: true
  validates :delivery_days_id, presence: true
  validates :price, presence: true
  validates_inclusion_of :price, in:300..9999999, message: 'Out of setting range'
  validates :price, numericality: { with: /\A[0-9]+\z/, message:'Half-width number' }
  validates :image, presence: true

  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :delivery_area
  belongs_to :delivery_days
  
   with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :delivery_area_id
    validates :delivery_days_id
  end
end
