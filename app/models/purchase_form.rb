class PurchaseForm
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :address, :building_name, :phone_number, :purchase_history, :user_id, :item_id


  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{11}\z/}
    validates :area_id

  end
  # ジャンルの選択が「--」の時は保存できないようにする
  validates :area_id, numericality: { other_than: 1 }

  def save
    # 購入履歴情報を保存し、変数purchase_historyに代入する
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id, )
    # 住所を保存する
    # purchase_history_idには、変数purchase_historyのidを指定する
    Purchase.create(post_code: post_code, area_id: area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_history_id: purchase_history.id)
  end
end