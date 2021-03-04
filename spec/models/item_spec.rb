require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it '商品の状態についての情報が必須であること' do
      @item.status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Status must be other than 1')
    end

    it '配送料の負担についての情報が必須であること' do
      @item.cost_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Cost must be other than 1')
    end

    it '発送元の地域についての情報が必須であること' do
      @item.area_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Area must be other than 1')
    end

    it '発送までの日数についての情報が必須であること' do
      @item.delivery_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery must be other than 1')
    end

    it '販売価格についての情報が必須であること' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = 'ああああ'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
