class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :cost
  belongs_to :area
  belongs_to :delivery

  with_options presence: true do
    validates :image
    validates :name,         length: { maximum: 40 }
    validates :description,  length: { maximum: 1000 }         
    # validates :category      
    # validates :status        
    # validates :cost          
    # validates :area          
    # validates :delivery      
     
    #  全角数字では保存できない / (逆に、全て半角数値を指定)
    validates :price,        format: { with: /\A[0-9]+\z/ }   
  end  
  
  # 半角数字の正規表現を使用しなくても、「numericality」を使用して含まれる
  validates :price,         numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  
  # ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :status_id, :cost_id, :area_id, :delivery_id, numericality: { other_than: 1 }
  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end

end
