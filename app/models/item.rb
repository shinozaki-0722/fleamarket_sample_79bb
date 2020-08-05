class Item < ApplicationRecord
  validates :images, presence: true
  validates_associated :images
  validates :item_name, presence: true,length:{maximum:40}
  validates :description, presence: true,length:{maximum:1000}
  validates :category_id, presence: true
  validates :condition, presence: true
  validates :preparation, presence: true
  validates :postage_payer, presence: true
  validates :prefecture, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  
  has_many :images, dependent: :destroy
  belongs_to :seller, class_name: "User"
  belongs_to :buyer,  class_name: "User"
  belongs_to :category
  accepts_nested_attributes_for :images, allow_destroy: true

  enum postage_payer:{
    "選択してください":0,
    "送料込み(出品者負担)":1,"着払い(購入者負担)":2
  }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :preparation

end