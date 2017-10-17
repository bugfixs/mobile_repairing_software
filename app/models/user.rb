class User < ApplicationRecord
  rolify
  resourcify
  belongs_to :general_setting
  scope :shod, ->(id) { where(id: id).take }
  scope :role_wise_users, ->(role) { where(role: role) }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def create_general_setting
    role = 'Admin'
    role = 'SuperAdmin' if id == 1
    gs = GeneralSetting.create(name: 'Samsung')
    update(general_setting_id: gs.id, role: role)
  end

  # get institute name
  def institute_name
    general_setting.name
  end

  # getter for current user
  def self.current
    Thread.current[:user]
  end

  # setter for current user
  def self.current=(user)
    Thread.current[:user] = user
  end

end
