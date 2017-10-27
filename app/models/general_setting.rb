class GeneralSetting < ApplicationRecord
	# has_one :user
	scope :shod, ->(id) { where(id: id).take }
	validates :name, presence: true, format: { with: /\A[a-zA-Z.&, " "]+\z/ },
                                     length: { in: 1..100 }, on: :update
end
