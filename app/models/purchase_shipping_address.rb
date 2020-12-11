class PurchaseShippingAddress

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :delivery_area_id, :municipality, :address, :building_name, :phone_number, :purchase_id, :token

  with_options presence:true do
    validates :postal_code
    validates :municipality
    validates :address
    validates :phone_number
    validates :token
    validates :user_id
    validates :item_id
  end

  validates :delivery_area_id, numericality: { other_than: 1 }
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, format: { with: /\A\d{10,11}\z/ }

  def save
    # user = User.create(nickname: nickname, email: email, encrypted_password: encrypted_password, last_name: last_name, first_name: first_name, last_name_kana: last_name_kana, first_name_kana: first_name_kana, birth_date: birth_date)
    # item = Item.create(name: name, explanation: explanation, category_id: category_id, condition_id: condition_id, delivery_fee_id: delivery_fee_id, delivery_area_id: delivery_area_id, delivery_days_id: delivery_days_id, price: price, user_id: user_id)
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, delivery_area_id: delivery_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
