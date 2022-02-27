class SaleProcessController < ApplicationController
    def tambahBarang
        SaleItem.create!(
            :receive_item_id => params[:id_receive_item],
            :measurement_id => params[:id_measurement],
            :warehouse_id => params[:id_warehouse],
            :sale_id => params[:id_sale],
            :jumlah_permintaan => params[:jumlah_dikeluarkan]
        )
        redirect_to sale_path(params[:id_sale]), notice: "Data barang sudah diinput"
    end

    def editSaleItem
        @sale_item = SaleItem.find(params[:id])
    end

    def updateItemBarang
        SaleItem.update(
            params[:id_sale_item],
            {
                :receive_item_id => params[:id_receive_item],
                :measurement_id => params[:id_measurement],
                :warehouse_id => params[:id_measurement],
                :sale_id => params[:id_sale],
                :jumlah_permintaan => params[:jumlah_dikeluarkan]
            }
        )
        redirect_to sale_path(params[:id_sale]), notice: "Data barang sudah diupdate"
    end

    def submitUserTrading
        Sale.update(
            params[:sale_id],
            {
                :status_id => params[:status_id],
                :id_role => params[:id_role],
            }
        )
        SaleHistory.create!(
            :status_id => params[:status_id],
            :sale_id => params[:sale_id],
            :role_id => params[:id_role],
            :user_id => current_user.id
        )
        redirect_to sale_path(params[:sale_id]), notice: "Data sudah disubmit"
    end

    def submitStaffGudang
        Sale.update(
            params[:sale_id],
            {
                :status_id => params[:status_id],
                :id_role => params[:id_role],
            }
        )
        SaleHistory.create!(
            :status_id => params[:status_id],
            :sale_id => params[:sale_id],
            :role_id => params[:id_role],
            :user_id => current_user.id
        )
        redirect_to sale_path(params[:sale_id]), notice: "Data sudah disubmit"
    end

    def editJumlahDikeluarkan
        @sale_item = SaleItem.find(params[:id])
    end

    def updateJumlahDikeluarkan
        SaleItem.update(
            params[:id_sale_item],
            {
                :receive_item_id => params[:id_receive_item],
                :measurement_id => params[:id_measurement],
                :warehouse_id => params[:id_warehouse],
                :sale_id => params[:id_sale],
                :jumlah_permintaan => params[:jumlah_permintaan],
                :jumlah_keluar => params[:jumlah_dikeluarkan]
            }
        )
        redirect_to sale_path(params[:id_sale]), notice: "Data barang sudah diupdate"
    end

    def submitKepalaGudang
        Sale.update(
            params[:sale_id],
            {
                :status_id => params[:status_id],
                :id_role => params[:id_role],
            }
        )
        SaleHistory.create!(
            :status_id => params[:status_id],
            :sale_id => params[:sale_id],
            :role_id => params[:id_role],
            :user_id => current_user.id,
            :catatan_penjualan => params[:catatan_penjualan]
        )
        getRole = Role.find(params[:id_role])
        redirect_to sale_path(params[:sale_id]), notice: "Data sudah di kirim ke #{getRole.name}"
    end

    def submitAdminPersediaan
        Sale.update(
            params[:sale_id],
            {
                :status_id => params[:status_id],
                :id_role => params[:id_role],
            }
        )
        SaleHistory.create!(
            :status_id => params[:status_id],
            :sale_id => params[:sale_id],
            :role_id => params[:id_role],
            :user_id => current_user.id,
            :catatan_penjualan => params[:catatan_penjualan]
        )
        getRole = Role.find(params[:id_role])
        redirect_to sale_path(params[:sale_id]), notice: "Data sudah di kirim ke #{getRole.name}"
    end

    def submitKadepPersediaan
        Sale.update(
            params[:sale_id],
            {
                :status_id => params[:status_id],
                :id_role => params[:id_role],
            }
        )
        SaleHistory.create!(
            :status_id => params[:status_id],
            :sale_id => params[:sale_id],
            :role_id => params[:id_role],
            :user_id => current_user.id,
            :catatan_penjualan => params[:catatan_penjualan]
        )
        redirect_to sale_path(params[:sale_id]), notice: "Data telah disubmit"
    end
end
