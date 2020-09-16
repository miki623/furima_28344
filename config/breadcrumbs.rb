crumb :root do
  link "Home", root_path
end

crumb :sign_up_user do
  link "ユーザー新規登録", new_user_registration_path
  parent :root
end

crumb :sign_in_user do
  link "ユーザーログイン", new_user_session_path
  parent :root
end

# crumb :item_show do |item|
#   link "商品の詳細", item_path(item)
#   parent :root
# end

crumb :item_show do
  link "商品の詳細", item_path(params[:id])
  parent :root
end

crumb :new_item do
  link "出品商品の登録", new_item_path
  parent :root
end

crumb :item_edit do
  link "商品の編集", edit_item_path(params[:id])
  parent :item_show
end

# crumb :transaction do |item|
#   link "商品の購入", item_transactions_path(params[:item_id])
#   parent :item_show, item
# end

crumb :transaction do
  link "商品の購入", item_transactions_path(params[:item_id])
  parent :root
end

