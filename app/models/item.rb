class Item < ApplicationRecord

  belongs_to :user 
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :area
  belongs_to :delivery
  
  
  validates :image,         presence: true    
  validates :name,          presence: true, length: { maximum: 40 }
  validates :description,   presence: true, length: { maximum: 1000 }
  validates :category,      presence: true
  validates :status,        presence: true
  validates :cost,          presence: true
  validates :area,          presence: true
  validates :delivery,      presence: true
                  
  validates :price,         presence: true
  # 半角数字の正規表現を使用しなくても、「numericality」を使用して含まれる
  validates :price,         numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }  

    
        
    #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :cost_id, :area_id, :delivery_id, numericality: { other_than: 1 } 

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

end 
