class SaleMailer < ApplicationMailer
    def sale_kepala_gudang
      # @user = params[:user]
      # @get_kepala_gudang_role = Role.find_by(id: 9)


      # @nama_inputer =
      # user.role_assignments.each_with_index.map {|role_assignment| "#{role_assignment.role.try(:name)}"}.join(", ")
      mail to: "muhammadrefda@gmail.com",
             # User.pluck(:email),
           # User.where(role: 'Kepala Gudang').pluck(:email)

           # subject: "Sale Order #{@user.sale_order.code} telah dibuat"
           subject: "1 data penjualan baru telah dibuat serta perlu di review",
           body:    "Ada 1 data penjualan baru perlu di review.\n\n" +
                    "Berikut link untuk melihat data tersebut: \n\n" +
                    "Terima kasih.\n\n" +
                    "Pesan ini dikirim oleh sistem, dimohon untuk tidak membalas pesan ini."
    end
  end

