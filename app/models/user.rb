class User < ApplicationRecord
  has_many :products
  has_many :images
  has_many :enrollments
  has_many :enrolled_products, through: :enrollments, source: :product

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def enrolled_in?(product)
    return enrolled_products.include?(product)
  end
end
