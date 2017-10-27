# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(email: "superadmin@qset.in",password:"123456789",role: "SuperAdmin")
gs = GeneralSetting.create!(name: 'Samsung')
user = User.create!(:email => 'samsungrepair@admin.in', :password => '123456789', :password_confirmation => '123456789', general_setting_id: gs.id, role: 'SuperAdmin')
