module SalesHelper
    def changeStatus(id)
        @roleAssign = RoleAssignment.left_outer_joins(:user,:role).where(user_id: current_user.id).select('roles.id AS role_id')
        if @roleAssign.first.role_id.to_i == 2 #Admin Persediaan
            @setStatusBaca = Sale.find(id)
            if @setStatusBaca.status_id == 23
                SaleHistory.create!(
                    sale_id: id,
                    user_id: current_user.id,
                    status_id: 24,
                )
                @getPenerimaan = Sale.find(id)
                @getPenerimaan.update(status_id: 24)
            end
        elsif @roleAssign.first.role_id.to_i == 3 #Kadep Persediaan
            @setStatusBaca = Sale.find(id)
            if @setStatusBaca.status_id == 16
                SaleHistory.create!(
                    sale_id: id,
                    user_id: current_user.id,
                    status_id: 17,
                )
                @getPenerimaan = Sale.find(id)
                @getPenerimaan.update(status_id: 17)
            end
        elsif @roleAssign.first.role_id.to_i == 4 #Staff Gudang
            @setStatusBaca = Sale.find(id)
            if @setStatusBaca.status_id == 18
                SaleHistory.create!(
                    sale_id: id,
                    user_id: current_user.id,
                    status_id: 19,
                )
                @getPenerimaan = Sale.find(id)
                @getPenerimaan.update(status_id: 19)
            end
        elsif @roleAssign.first.role_id.to_i == 5 #Kepala Gudang
            @setStatusBaca = Sale.find(id)
            if @setStatusBaca.status_id == 20
                @getRecieveItem = SaleItem.where(sale_id: id)
                SaleHistory.create!(
                    sale_id: id,
                    status_id: 21,
                    user_id: current_user.id
                )
                @getPenerimaan = Sale.find(id)
                @getPenerimaan.update(status_id: 21)
            end
        end
    end
end
