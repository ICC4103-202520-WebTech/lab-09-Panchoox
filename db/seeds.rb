# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


admin_attrs = {
	name: 'Admin',
	email: 'admin@example.com',
	password: 'password',
	password_confirmation: 'password',
	role: :admin
}

admin = User.find_by(email: admin_attrs[:email])
if admin
	admin.update(admin_attrs.except(:password, :password_confirmation))
	# only set password if it's blank or to force-reset in dev
	admin.password = admin_attrs[:password] if admin.encrypted_password.blank?
	admin.save!
else
	User.create!(admin_attrs)
end
