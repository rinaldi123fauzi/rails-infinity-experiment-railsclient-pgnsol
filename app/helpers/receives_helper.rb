module ReceivesHelper
    def changeStatus(id)
        @roleAssign = RoleAssignment.left_outer_joins(:user,:role).where(user_id: current_user.id).select('roles.id AS role_id')
        if @roleAssign.first.role_id.to_i == 2 #Admin Persediaan
            @setStatusBaca = ReceiveHistory.where(receive_id: id).last
            @getRecieveItem = ReceiveItem.where(receive_id: id)
        elsif @roleAssign.first.role_id.to_i == 3 #Kadep Persediaan
            @setStatusBaca = Receive.find(id)
            if @setStatusBaca.status_id == 3
                @getRecieveItem = ReceiveItem.where(receive_id: id)
                ReceiveHistory.create!(
                    receive_id: id,
                    status_id: 4,
                )
                @getPenerimaan = Receive.find(id)
                @getPenerimaan.update(status_id: 4)
            end
        elsif @roleAssign.first.role_id.to_i == 4 #Staff Gudang
            @setStatusBaca = Receive.find(id)
            if @setStatusBaca.status_id == 5
                ReceiveHistory.create!(
                    receive_id: id,
                    status_id: 6,
                )
                @getPenerimaan = Receive.find(id)
                @getPenerimaan.update(status_id: 6)
            end
        elsif @roleAssign.first.role_id.to_i == 5 #Kepala Gudang
            @setStatusBaca = Receive.find(id)
            if @setStatusBaca.status_id == 7
                @getRecieveItem = ReceiveItem.where(receive_id: id)
                ReceiveHistory.create!(
                    receive_id: id,
                    status_id: 8,
                )
                @getPenerimaan = Receive.find(id)
                @getPenerimaan.update(status_id: 8)
            end
        end
    end
end
