class User < ApplicationRecord
  require 'digest/md5'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def gravatar
      md5 = Digest::MD5.hexdigest(self.email)
      "https://www.gravatar.com/avatar/#{md5}"
  end

end
