require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  describe '#create' do
    before do
      @purchase_form = FactoryBot.build(:purchase_form)
      @user = FactoryBot.build(:user)
      @item = FactoryBot.build(:item)
    end

    context '商品購入登録できるとき' do
      it 'post_code,area_id,city,address,builing_name,phone_number,が存在すれば登録できる' do
        expect(@purchase_form).to be_valid
      end
    end

    context '商品購入登録できないとき' do
      it '郵便番号が必須であること' do
        @purchase_form.post_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Post code can't be blank")
      end

      it '都道府県についての情報が必須であること' do
        @purchase_form.area_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Area must be other than 1')
      end

      it '市区町村についての情報が必須であること' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地についての情報が必須であること' do
        @purchase_form.address = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が必須であること' do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が11桁必須であること' do
        @purchase_form.phone_number = 123_456_789
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone number is invalid')
      end

      it 'tokenが空では登録できないこと' do
        @purchase_form.token = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
