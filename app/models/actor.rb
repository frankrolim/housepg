class Actor < ApplicationRecord
  has_and_belongs_to_many :movies

  def to_s
    self.name
  end
end
