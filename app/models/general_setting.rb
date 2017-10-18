class GeneralSetting < ApplicationRecord
	has_one :user
	scope :shod, ->(id) { where(id: id).take }
	validates :name, presence: true, format: { with: /\A[a-zA-Z.&, " "]+\z/ },
                                     length: { in: 1..100 }, on: :update
  	validates :address, presence: true,
                                        length: { in: 1..100 }, on: :update
  	validates :contact, presence: true, length: { in: 6..11 },
                                         format: { with: /\A[0-9]+\z/ }, on: :update
    validates :email, presence: true, format: \
  { with: /\A[a-zA-Z0-9._-]+@([a-zA-Z0-9]+\.)+[a-zA-Z]{2,4}+\z/ }

end
