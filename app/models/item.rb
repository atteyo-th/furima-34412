class Item < ApplicationRecord

  belongs_to :user 
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :area
  belongs_to :delivery
  
    #空の投稿を保存できないようにする
  validates :category,   presence: true
  validates :status,     presence: true
  validates :cost,       presence: true
  validates :area,       presence: true
  validates :delivery,   presence: true
      
    #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :cost_id, :area_id, :delivery_id, numericality: { other_than: 1 } 

end 
