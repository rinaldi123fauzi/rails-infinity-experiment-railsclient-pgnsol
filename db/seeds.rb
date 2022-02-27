# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Division.create(nama_divisi: 'Tanpa Divisi')

# p "#{Division.count} Divisi Telah Dibuat"

# Role.create(name: 'superadmin', type: "Role")

# p "#{Role.count} Role Telah Dibuat"

# User.create!([{
#                name: 'superadmin',
#                username: 'super-admin',
#                email: 'muhammadrefda@gmail.com',
#                password: '123456',
#                state: true,
#                confirm: true,
#                user_type: 'Manual',
#                division_id: 1
#              }])

# p "#{User.count} User Telah Dibuat"

# RoleAssignment.create(
#   user_id: 1,
#   role_id: 1
# )

# p "#{RoleAssignment.count} Role Assignment Telah Dibuat"

# Status.create(nama_status: 'draft')
# Status.create(nama_status: 'belum di review oleh kadep persediaan')
# Status.create(nama_status: 'telah di review oleh kadep persediaan')
# Status.create(nama_status: 'belum di review ole staff gudang')
# Status.create(nama_status: 'telah di review oleh staff gudang')
# Status.create(nama_status: 'belum di review oleh kepala gudang')
# Status.create(nama_status: 'telah di review oleh kepala gudang')

Status.create(nama_status: 'belum di review oleh admin persediaan')
Status.create(nama_status: 'telah di review oleh admin persediaan')

p "#{Status.count} Status Telah Dibuat"
