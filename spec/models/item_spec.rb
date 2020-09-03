require "rails_helper"

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("public/test_image.png")
  end

  describe "商品出品機能" do
    context "商品出品に成功するとき" do
      it "全ての値が正しく入力されていれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context "商品出品に失敗するとき" do
      it "nameが空だと出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("【商品名】を入力してください")
      end
      it "nameが40文字以上では出品できない" do
        @item.name = "pikachu" * 8
        @item.valid?
        expect(@item.errors.full_messages).to include("【商品名】は40文字以内で入力してください")
      end
      it "infoが空だと出品できない" do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("【説明文】を入力してください")
      end
      it "infoが1000文字以上だと出品できない" do
        @item.info = "かわいいポケモンです！" * 100
        @item.valid?
        expect(@item.errors.full_messages).to include("【説明文】は1000文字以内で入力してください")
      end
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it "categoryが空だと出品できない" do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("【商品カテゴリー】を入力してください")
      end
      it "sales_status(商品の状態)が空だと出品できない" do
        @item.sales_status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("【商品の状態】を入力してください")
      end
      it "delivery_fee(配送料の負担)が空だと出品できない" do
        @item.delivery_fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("【配送料の負担】を入力してください")
      end
      it "shipping_area(配送元の地域)が空だと出品できない" do
        @item.shipping_area = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("【発送元の地域】を入力してください")
      end
      it "scheduled_delivery(発送までの日数)が空だと出品できない" do
        @item.scheduled_delivery = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("【発送までの日数】を入力してください")
      end
      it "priceが空だと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("【販売価格】を入力してください", "【販売価格】は数値で入力してください")
      end
      it "priceが¥9,999,999を超えると出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("【販売価格】は9999999以下の値にしてください")
      end
      it "priceが¥300未満の場合出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("【販売価格】は300以上の値にしてください")
      end
    end

  end
end