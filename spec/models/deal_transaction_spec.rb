require "rails_helper"

RSpec.describe DealTransaction, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("public/test_image.png")
    @item.save
    @transaction = FactoryBot.build(:deal_transaction,user_id: @user.id, item_id: @item.id)
    
  end

  describe "クレジットカード決済機能" do
    context "クレジットカード決済に成功するとき" do
      it "全ての値が正しく入力されていれば出品できる" do
        expect(@transaction).to be_valid
      end
      it "building_nameは任意なので空でも保存できること" do
        @transaction.building_name = nil
        expect(@transaction).to be_valid
      end
    end
    context "クレジットカード決済に失敗するとき" do
      it "postal_codeが空の場合完了できない" do
        @transaction.postal_code = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Postal code can't be blank", "Postal code  Input correctly")
      end
      it "postal_codeが「三桁-四桁」の形でないと完了できない" do
        @transaction.postal_code = "333333"
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Postal code  Input correctly")
      end
      it "shipping_area(県名)が空だと完了できない" do
        @transaction.shipping_area_id = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Shipping area can't be blank")
      end
      it "city(市町村)が空だと完了できない" do
        @transaction.city = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("City can't be blank")
      end
      it "house_number(番地)が空では完了できないこと" do
        @transaction.house_number = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("House number can't be blank")
      end
      it "電話番号が空では完了できないこと" do
        @transaction.phone_number = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号が11桁以内の数字のみでしか完了できないこと" do
        @transaction.phone_number = "898989898989"
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Phone number can't be blank")
      end
      it "tokenがなければ保存できないこと" do
        @transaction.token = nil
        @transaction.valid?
        expect(@transaction.errors.full_messages).to include("Token can't be blank")
      end
    end
    
  end

end