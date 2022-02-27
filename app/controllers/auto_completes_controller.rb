class AutoCompletesController < ApplicationController
  def search_kode_proyek
    if params[:term]

      render json: Receive.where('kode_proyek like (?) or lower(nama_proyek) like (?)',"%#{params[:term]}%","%#{params[:term]}%")
                          .select(:id, :kode_proyek, :nama_proyek, :kode_akun, :nama_akun)
                          .uniq(&:kode_proyek)
                          .map { |kp|
                            if kp.kode_proyek.match(/1000-41/) || kp.kode_proyek.match(/1011-41/) || kp.kode_proyek.match(/1012-41/) || kp.kode_proyek.match(/1013-41/) || kp.kode_proyek.match(/1014-41/) || kp.kode_proyek.match(/1015-41/) || kp.kode_proyek.match(/1016-41/) || kp.kode_proyek.match(/1017-41/) || kp.kode_proyek.match(/1021-41/) || kp.kode_proyek.match(/1022-41/) || kp.kode_proyek.match(/1023-41/) || kp.kode_proyek.match(/1024-41/) || kp.kode_proyek.match(/1025-41/) || kp.kode_proyek.match(/1026-41/) || kp.kode_proyek.match(/1031-41/) || kp.kode_proyek.match(/1032-41/) || kp.kode_proyek.match(/1033-41/) || kp.kode_proyek.match(/1034-41/) || kp.kode_proyek.match(/1035-41/)
                              {
                              :value => kp.id,
                              :label => "#{kp.kode_proyek} - #{kp.nama_proyek}",
                              :v_kode_proyek => kp.kode_proyek,
                              :v_nama_proyek => kp.nama_proyek,
                              :v_kode_akun => kp.kode_akun,
                              :v_nama_akun => kp.nama_akun
                            }
                            else
                              {}
                            end
                            }
    end
  end

  def search_kode_program
    if params[:term]

      render json: Receive.where('kode_program like (?) or lower(nama_program) like (?)',"%#{params[:term]}%","%#{params[:term]}%")
                          .select(:id, :kode_program, :nama_program, :kode_akun, :nama_akun)
                          .uniq(&:kode_program)
                          .map { |k_program|
                            if k_program.kode_program.match(/1000-41/) || k_program.kode_program.match(/1011-41/) || k_program.kode_program.match(/1012-41/) || k_program.kode_program.match(/1013-41/) || k_program.kode_program.match(/1014-41/) || k_program.kode_program.match(/1015-41/) || k_program.kode_program.match(/1016-41/) || k_program.kode_program.match(/1017-41/) || k_program.kode_program.match(/1021-41/) || k_program.kode_program.match(/1022-41/) || k_program.kode_program.match(/1023-41/) || k_program.kode_program.match(/1024-41/) || k_program.kode_program.match(/1025-41/) || k_program.kode_program.match(/1026-41/) || k_program.kode_program.match(/1031-41/) || k_program.kode_program.match(/1032-41/) || k_program.kode_program.match(/1033-41/) || k_program.kode_program.match(/1034-41/) || k_program.kode_program.match(/1035-41/)
                              {
                                :value => k_program.id,
                                :label => "#{k_program.kode_program} - #{k_program.nama_program}",
                                :v_kode_program => k_program.kode_program,
                                :v_nama_program => k_program.nama_program,
                                :v_kode_akun => k_program.kode_akun,
                                :v_nama_akun => k_program.nama_akun
                              }
                            else
                              {}
                            end
                          }
    end
  end

  def search_kode_proyek_for_project
    if params[:term]

      render json: Receive.where('kode_proyek like (?) or lower(nama_proyek) like (?)',"%#{params[:term]}%","%#{params[:term]}%")
                          .select(:id, :kode_proyek, :nama_proyek, :kode_akun, :nama_akun)
                          .uniq(&:kode_proyek)
                          .map { |kpp|
                            if kpp.kode_proyek.match(/1000-3/) || kpp.kode_proyek.match(/1011-3/) || kpp.kode_proyek.match(/1012-3/) || kpp.kode_proyek.match(/1013-3/) || kpp.kode_proyek.match(/1014-3/) || kpp.kode_proyek.match(/1015-3/) || kpp.kode_proyek.match(/1016-3/) || kpp.kode_proyek.match(/1017-3/) || kpp.kode_proyek.match(/1021-3/) || kpp.kode_proyek.match(/1022-3/) || kpp.kode_proyek.match(/1023-3/) || kpp.kode_proyek.match(/1024-3/) || kpp.kode_proyek.match(/1025-3/) || kpp.kode_proyek.match(/1026-3/) || kpp.kode_proyek.match(/1031-3/) || kpp.kode_proyek.match(/1032-3/) || kpp.kode_proyek.match(/1033-3/) || kpp.kode_proyek.match(/1034-3/) || kpp.kode_proyek.match(/1035-3/)
                            {
                              :value => kpp.id,
                              :label => "#{kpp.kode_proyek} - #{kpp.nama_proyek}",
                              :p_kode_proyek => kpp.kode_proyek,
                              :p_nama_proyek => kpp.nama_proyek,
                              :p_kode_akun => kpp.kode_akun,
                              :p_nama_akun => kpp.nama_akun
                            }
                          else
                            { 
                              :label => ""
                             }
                            end
                          }             
    end
  end

  def kode_proyek_for_maintenance
    if params[:term]

      render json: Receive.where('kode_proyek like (?) or lower(nama_proyek) like (?)',"%#{params[:term]}%","%#{params[:term]}%")
                          .select(:id, :kode_proyek, :nama_proyek, :kode_akun, :nama_akun)
                          .uniq(&:kode_proyek)
                          .map { |ma|
                            if ma.kode_proyek.match(/1000-32/) || ma.kode_proyek.match(/1011-32/) || ma.kode_proyek.match(/1012-32/) || ma.kode_proyek.match(/1013-32/) || ma.kode_proyek.match(/1014-32/) || ma.kode_proyek.match(/1015-32/) || ma.kode_proyek.match(/1016-32/) || ma.kode_proyek.match(/1017-32/) || ma.kode_proyek.match(/1021-32/) || ma.kode_proyek.match(/1022-32/) || ma.kode_proyek.match(/1023-32/) || ma.kode_proyek.match(/1024-32/) || ma.kode_proyek.match(/1025-32/) || ma.kode_proyek.match(/1026-32/) || ma.kode_proyek.match(/1031-32/) || ma.kode_proyek.match(/1032-32/) || ma.kode_proyek.match(/1033-32/) || ma.kode_proyek.match(/1034-32/) || ma.kode_proyek.match(/1035-32/)
                              {
                                :value => ma.id,
                                :label => "#{ma.kode_proyek} - #{ma.nama_proyek}",
                                :v_kode_proyek => ma.kode_proyek,
                                :v_nama_proyek => ma.nama_proyek,
                                :v_kode_akun => ma.kode_akun,
                                :v_nama_akun => ma.nama_akun
                              }
                            else
                              {
                                :label => ""
                              }

                            end
                          }
    end
  end

  def search_sale_item
    if params[:term]
      #todo : mau cari berdasarkan nama item, tp adanya item_id
      render json: ReceiveItem.where('qr_code like (?)',"%#{params[:term]}%")
                          .select(:id, :kode_proyek, :nama_proyek, :kode_akun, :nama_akun)
                          .map { |ma|
                              {
                                :value => ma.id,
                                :label => "#{ma.kode_proyek} - #{ma.nama_proyek}",
                                :v_kode_proyek => ma.kode_proyek,
                                :v_nama_proyek => ma.nama_proyek,
                                :v_kode_akun => ma.kode_akun,
                                :v_nama_akun => ma.nama_akun
                              }
                          }
    end
  end

  # def search_vendor
  #   if params[:term]
  #     render json: Vendor.joins("left join vendor_taxes t on t.vendor_id = vendors.id")
  #         .select(:id, :name, :address, :phone, :email, :'t.number')
  #         .where("lower(vendors.name) like ? and t.tax_type = 'Nomor Pokok Wajb Pajak (NPWP)' and t.status = 1", "%#{params[:term]}%")
  #         .distinct
  #         .map { |vendor|
  #         { :value => vendor.id, :label => vendor.name,
  #          :v_name => vendor.name}
  #       }
  #   end
  # end



    def search_vendor
        if params[:term]
            render json: Vendor.select(:name)
                        .where('name LIKE ? and (status = ? or status = ?)', "%#{params[:term]}%", '1', '2')
                        .map{ |vendor|
                            {:value => vendor.name}
                        }
        end
    end

end