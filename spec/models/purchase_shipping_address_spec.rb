require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  before do
    @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address)
  end

  describe '商品の購入' do
    it '全ての値が正しく入力されていれば保存できること' do
      expect(@purchase_shipping_address).to be_valid
    end

    it '郵便番号の入力が空だと登録できないこと' do
      @purchase_shipping_address.postal_code = nil
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号にはハイフンが必要であること' do
      @purchase_shipping_address.postal_code = '1234567'
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Postal code is invalid")
    end

    it '都道府県の入力が１ではないこと' do
      @purchase_shipping_address.delivery_area_id = 1
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Delivery area must be other than 1")
    end

    it '市区町村の入力が空ではないこと' do
      @purchase_shipping_address.municipality = ""
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Municipality can't be blank")
    end

    it '番地の入力が空ではないこと' do
      @purchase_shipping_address.address = ""
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空ではないこと' do
      @purchase_shipping_address.phone_number = nil
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号はハイフンは不要であること' do
      @purchase_shipping_address.phone_number = "-"
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Phone number is invalid")
    end

    it '電話番号は11桁以内であること' do
      @purchase_shipping_address.phone_number ='090123456789'
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Phone number is invalid")
    end

    it '正しいクレジットカードの情報で無いときは決済できないこと' do
      @purchase_shipping_address.token = nil
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'user_idが空の場合は登録出来ないこと' do
      @purchase_shipping_address.user_id = nil
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空の場合は登録が出来ないこと' do
      @purchase_shipping_address.item_id = nil
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Item can't be blank")
    end

    it '建物名が空でも登録ができること' do
      @purchase_shipping_address.building_name = ""
      expect(@purchase_shipping_address).to be_valid
    end
  end
end
