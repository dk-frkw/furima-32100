require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do

  
    it "商品画像を一枚つけることが必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が必須であること" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "商品の説明が必須であること" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "カテゴリーの情報が１だと登録できないこと" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "商品の状態についての情報が１だと登録できないこと" do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end
    it "配送料の負担についての情報が1だと登録できないこと" do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
    end
    it "配送元の地域についての情報が１だと登録できないこと" do
      @item.delivery_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery area must be other than 1")
    end
    it "発送までの日数についての情報が１だと登録できないこと" do
      @item.delivery_days_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery days must be other than 1")
    end
    it "価格についての情報が必須であること" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格の範囲が、¥300以上であること" do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it "価格の範囲が、¥9,999,999以上であること" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
    it "販売価格は半角のみ保存可能であること" do
      @item.price = "５００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end
  end
end


