class Room < ApplicationRecord

  has_many :users, dependent: :destroy
  has_many :messages

end
