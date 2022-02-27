class HistoryPenjualanController < ApplicationController
    # def printQRCode
    #     @id_receiveItem = params[:id_receiveItem]
    #     respond_to do |format|
    #         format.html
    #         format.pdf do
    #         render pdf: "receive_process",
    #         layout:'pdf_layout.html',
    #         template: 'receive_process/printQRCode',
    #         page_size: 'A4',
    #         orientation: 'Portrait',
    #         encoding:"UTF-8",
    #         show_as_html: params.key?('debug')
    #         end
    #     end
    # end

    def sendStaffGudang
        @setStatusApproval = PengeluaranApproval.where(sale_id: params[:sale_id]).last
        @setStatusApproval.update(status_id: 7)
        @setStatusApproval.update(role_id: 5)
        @setStatusReceive = Sale.find(params[:sale_id])
        @setStatusReceive.update(status_id: 7)
        @setStatusReceive.update(id_role: 5)
        redirect_to sale_path(params[:sale_id]), notice: "Data Sudah Dikirim"
    end

    def setPosting
        @setStatusReceive = Sale.find(params[:sale_id])
        if params[:kategori] == "posting"
            @setStatusReceive.update(status_id: params[:status])
            @setStatusApproval = PengeluaranApproval.find_by_sale_id_and_role_id(params[:sale_id], 5)
            @setStatusApproval.update(status_id: params[:status])
            @setStatusApproval.update(status_approval: params[:status_approval])
            redirect_to sale_path(params[:sale_id]), notice: "Data Sudah Diposting"
        else
            if params[:role].present?
                PengeluaranApproval.create!(
                    :sale_id => params[:sale_id],
                    :status_id => 11,
                    :status_approval => params[:status_approval],
                    :role_id => params[:role],
                    :catatan_pengeluaran_penjualan => params[:catatan_pengeluaran_penjualan]
                )
                Sale.update(params[:sale_id], {:status_id => 11, :id_role => params[:role]})
                redirect_to sale_path(params[:sale_id]), notice: "Data Revisi Sudah Dikirim"
            end
        end
    end


    def index
        @roleAssign = RoleAssignment.left_outer_joins(:user,:role).where(user_id: current_user.id).select('roles.id AS role_id')
        if @roleAssign.first.role_id.to_i == 2
            @setStatusBaca = PengeluaranApproval.find(params[:id])
            @getRecieveItem = ReceiveItem.where(receive_id: @setStatusBaca.receive_id)
        elsif @roleAssign.first.role_id.to_i == 3
            @setStatusBaca = ReceiveHistory.find(params[:id])
            @getRecieveItem = ReceiveItem.where(receive_id: @setStatusBaca.receive_id)
            @setStatusBaca.update(status_id: 4)
            @getPenerimaan = Receive.find(@setStatusBaca.receive_id)
            @getPenerimaan.update(status_id: 4)
        elsif @roleAssign.first.role_id.to_i == 4
            @setStatusBaca = ReceiveHistory.find_by_id_and_role_id(params[:id], 4)
            @getRecieveItem = ReceiveItem.where(receive_id: @setStatusBaca.receive_id)
            @setStatusBaca.update(status_id: 6)
            @getPenerimaan = Receive.find(@setStatusBaca.receive_id)
            @getPenerimaan.update(status_id: 6)
        elsif @roleAssign.first.role_id.to_i == 5
            @setStatusBaca = ReceiveHistory.find_by_id_and_role_id(params[:id], 5)
            @getRecieveItem = ReceiveItem.where(receive_id: @setStatusBaca.receive_id)
            @setStatusBaca.update(status_id: 8)
            @getPenerimaan = Receive.find(@setStatusBaca.receive_id)
            @getPenerimaan.update(status_id: 8)
        end
    end

    def setStatus
        if params[:status] == "rejected"
            @getPenerimaan = Receive.find(params[:receive_id])
            @getPenerimaan.update(status_id: 12)
            @getPenerimaan.update(id_role: 2)
            ReceiveHistory.create!(
                receive_id: params[:receive_id],
                catatan_penerimaan: params[:catatan_penerimaan],
                user_id: current_user.id,
                status_id: 12,
                role_id: 2
            )
            @notice = "Reject Penerimaan Berhasil"
        else params[:status] == "approved"
            @getPenerimaan = Receive.find(params[:receive_id])
            @getPenerimaan.update(status_id: 5)
            @getPenerimaan.update(id_role: 4)
            ReceiveHistory.create!(
                receive_id: params[:receive_id],
                catatan_penerimaan: params[:catatan_penerimaan],
                user_id: current_user.id,
                status_id: 5,
                role_id: 4
            )
            @notice = "Approve Penerimaan Berhasil"
        end
        redirect_to receife_path(params[:receive_id]), notice: @notice
    end
end