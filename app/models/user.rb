class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  pay_customer

  before_validation(on: :create) do
    if pay_customers.empty?
      set_payment_processor(:stripe)
    end
  end
end
