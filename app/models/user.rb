class User < ApplicationRecord
  require 'digest/md5'
  has_one :cart
  has_many :orders

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :init_cart

  def gravatar
      md5 = Digest::MD5.hexdigest(self.email)
      "https://www.gravatar.com/avatar/#{md5}"
  end

  protected

    def init_cart
      Cart.create({user: self})
    end

end
