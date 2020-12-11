class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'に全角文字で入力してください' } do
    validates :last_name, presence: true
    validates :first_name, presence: true
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: 'に全角カタカナで入力してください' } do
    validates :last_name_kana, presence: true
    validates :first_name_kana, presence: true
  end

  validates :birth_date, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'に6文字以上の半角英数混合で入力して下さい'}

  has_many :items
  has_many :purchases
end
