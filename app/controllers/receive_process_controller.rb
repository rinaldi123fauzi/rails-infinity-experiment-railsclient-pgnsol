class ReceiveProcessController < ApplicationController
    def setLokasiPenempatan
        ReceiveItem.update(params[:receive_item_id],{lokasi_penempatan: params[:lokasi_penempatan], warehouse_id: params[:warehouse_id]})
        redirect_to receife_path(params[:receive_id]), notice: "Receive location was successfully created."
    end

    def printQRCode
        @id_receiveItem = params[:id_receiveItem]
        respond_to do |format|
            format.html
            format.pdf do
            render pdf: "receive_process", 
            layout:'pdf_layout.html',
            template: 'receive_process/printQRCode',
            page_size: 'A4',
            orientation: 'Portrait',
            encoding:"UTF-8",
            show_as_html: params.key?('debug')
            end
        end        
    end

    def confirmRejectKepalaGudangByAdmin
        ReceiveHistory.create!(
            receive_id: params[:receive_id],
            status_id: params[:status_id],
            user_id: current_user.id,
            role_id: params[:id_role]
        )
        Receive.update(params[:receive_id], {role_id: params[:id_role], status_id: params[:status_id]})
        redirect_to receife_path(params[:receive_id]), notice: "Data Sudah Dikirim ke Kepala Gudang"
    end

    def sendStaffGudang
        ReceiveHistory.create!(
            receive_id: params[:receive_id],
            user_id: current_user.id,
            status_id: 7,
            role_id: 5
        )
        @setStatusReceive = Receive.find(params[:receive_id])
        @setStatusReceive.update(status_id: 7)
        @setStatusReceive.update(id_role: 5)
        redirect_to receife_path(params[:receive_id]), notice: "Data Sudah Dikirim"
    end

    def setPosting
        @setStatusReceive = Receive.find(params[:receive_id])
        if params[:kategori] == "posting"
            url = "https://fasoldev.pgn-solution.co.id/infinity_receives/create_receives_api"

            @receive = { 
                receive_id: @setStatusReceive.id.to_i,
                tgl_masuk: @setStatusReceive.created_at,
                jenis: @setStatusReceive.jenis,
                kode: @setStatusReceive.kode_transaksi_penerimaan,
                project_program: @setStatusReceive.kategori_kode.upcase,
                # kode_project: @setStatusReceive.kategori_kode.upcase == "PROJECT" ? @setStatusReceive.kode_proyek : @setStatusReceive.kode_program,
                # nama_project: @setStatusReceive.kategori_kode.upcase == "PROJECT" ? @setStatusReceive.nama_proyek : @setStatusReceive.nama_program,
                kode_project: @setStatusReceive.kode_proyek,
                nama_project: @setStatusReceive.nama_proyek,
                kode_akun: @setStatusReceive.kode_akun
            }
            
            @postReceive = RestClient::Request.execute(:url => "#{url}", 
                :method => "POST", 
                :verify_ssl => false, 
                payload: { receive: @receive, receive_item: @receive_item }, 
                headers: { content_type: :json, accept: :json }
            )

            @ReceiveResponse = JSON.parse(@postReceive)

            puts @ReceiveResponse

            @setStatusReceive.update(status_id: params[:status])
            @setStatusApproval = ReceiveHistory.find_by_receive_id_and_role_id(params[:receive_id], 5)
            @setStatusApproval.update(status_id: params[:status])
            @setStatusApproval.update(status_approval: params[:status_approval])

            redirect_to receife_path(params[:receive_id]), notice: "Data Sudah Diposting"
        else
            if params[:role].present?
                ReceiveHistory.create!(
                    :receive_id => params[:receive_id],
                    :status_id => 11,
                    :status_approval => params[:status_approval],
                    :role_id => params[:role],
                    :catatan_penerimaan => params[:catatan_penerimaan]
                )
                Receive.update(params[:receive_id], {:status_id => 11, :id_role => params[:role]})
                redirect_to receife_path(params[:receive_id]), notice: "Data Revisi Sudah Dikirim"
            end
        end
    end

    def input_rack
        @receive_items = ReceiveItem.find(params[:id])
        @getGudang = Receive.find(@receive_items.receive_id)
    end

    def edit_rack
        @receive_items = ReceiveItem.find(params[:id])
        @getGudang = Receive.find(@receive_items.receive_id)
    end

    def index
        @roleAssign = RoleAssignment.left_outer_joins(:user,:role).where(user_id: current_user.id).select('roles.id AS role_id')
        if @roleAssign.first.role_id.to_i == 2
            @setStatusBaca = ReceiveHistory.find(params[:id])
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