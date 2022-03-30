class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

	devise :invitable, :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable

  has_many :clients, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :discounts, dependent: :destroy
end
