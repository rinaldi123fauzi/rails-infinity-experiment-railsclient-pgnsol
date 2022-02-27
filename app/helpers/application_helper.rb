module ApplicationHelper
  require 'net/http'

  def getDetailItem(id)
      @value = Item.find(id)
      result = "#{@value.nama_barang}, #{@value.ukuran ? @value.ukuran + "," : ""} #{@value.tipe ? @value.tipe + "," : ""} #{@value.merek ? @value.merek + "," : ""} #{@value.serial ? @value.serial + "," : ""} #{@value.lain}"
      return result
  end

  def getDetailItemFromReceiveItem(id)
    @value = ReceiveItem.find(id)
    result = "#{@value.item.nama_barang}, #{@value.item.ukuran ? @value.item.ukuran + "," : ""} #{@value.item.tipe ? @value.item.tipe + "," : ""} #{@value.item.merek ? @value.item.merek + "," : ""} #{@value.item.serial ? @value.item.serial + "," : ""} #{@value.item.lain}"
    return result
  end

  public def getProjectOrProgramPenerimaanParams(parameter, kategori)
    if parameter.present?
      @receive = Receive.where('division_id = ? and kategori_kode = ?', current_user.division_id, kategori).order(:id => :asc)
      option = '<option value=""></value>'
      f = {}
      
      @receive.each do |receive|
        if receive.kode_proyek.present?
          f["#{receive.kode_proyek} | #{receive.nama_proyek} - #{receive.id}"] = "#{receive.kode_proyek} | #{receive.nama_proyek}"
        end
      end 
      f.sort_by { |key| key }
      f.each do |k,v|
        if v.match(/#{parameter}/)
          selected = "selected"
        end
        # if v.match(/1000-42/)
          option = option + '<option value="'+k+'" '+selected.to_s+'>'+v+'</option>'
        # end
      end
      
      return option
    end
  end

  def getProjectOrProgramPenerimaan(kategori)
    @receive = Receive.where('division_id = ? and kategori_kode = ?', current_user.division_id, kategori).order(:id => :asc)
    option = '<option value=""></value>'
    f = {}
    
    @receive.each do |receive|
      if receive.kode_proyek.present?
        f["#{receive.kode_proyek} | #{receive.nama_proyek} ^ #{receive.id}"] = "#{receive.kode_proyek} | #{receive.nama_proyek}"
      end
    end 
    f.sort_by { |key| key }
    f.each do |k,v|
      # if v.match(/1000-42/)
        option = option + '<option value="'+k+'">'+v+'</option>'
      # end
    end
    
    return option
  end

  public def getGudangPengembalianParams(parameter)
      if parameter.present?
          @gudang = Warehouse.order(:id => :asc)
          option = '<option value=""></value>'
          f = {}
          
          @gudang.each do |gudang|
          f["#{gudang.nama_gudang}"] = gudang.nama_gudang
          end 
          f.sort_by { |key| key }
          f.each do |k,v|
              if v.match(/#{parameter}/)
                  selected = "selected"
              end
              option = option + '<option value="'+k+'" '+selected.to_s+'>'+v+'</option>'
          end
          
          return option           
      end
  end

  def getGudangPengembalian
      @gudang = Warehouse.order(:id => :asc)
      option = '<option value=""></value>'
      f = {}
      
      @gudang.each do |gudang|
      f["#{gudang.nama_gudang}"] = gudang.nama_gudang
      end 
      f.sort_by { |key| key }
      f.each do |k,v|
      option = option + '<option value="'+k+'">'+v+'</option>'
      end
      
      return option
  end

  public def getNoPengeluaranParams(parameter)
      if parameter.present?
          @pengeluaran = MaintenanceAsset.order(:id => :asc)
          option = '<option value=""></value>'
          f = {}
          
          @pengeluaran.each do |pengeluaran|
          f["#{pengeluaran.nomor_pengeluaran}"] = pengeluaran.nomor_pengeluaran
          end 
          f.sort_by { |key| key }
          f.each do |k,v|
              if v.match(/#{parameter}/)
                  selected = "selected"
              end
              option = option + '<option value="'+k+'" '+selected.to_s+'>'+v+'</option>'
          end
          
          return option           
      end
  end

  def getNoPengeluaran
      @pengeluaran = MaintenanceAsset.order(:id => :asc)
      option = '<option value=""></value>'
      f = {}
      
      @pengeluaran.each do |pengeluaran|
      f["#{pengeluaran.nomor_pengeluaran}"] = pengeluaran.nomor_pengeluaran
      end 
      f.sort_by { |key| key }
      f.each do |k,v|
      option = option + '<option value="'+k+'">'+v+'</option>'
      end
      
      return option
  end

  #dari aplikasi fast
  public def getProgramParams(parameter)
    if parameter.present?
      uri = URI.parse('http://192.168.60.136:3000/fast/programs')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = false
      request = Net::HTTP::Get.new(uri.request_uri)
      request['Authorization'] = 'Bearer 4854b5b486f4159566c80d842850b967'
      response = http.request(request)

      parsed = JSON.parse(response.body)
      option = '<option value=""></value>'
      f = {}
      parsed['result']['data'].each do |e|
        f["#{e['code']} - #{e['uraian']}"] = "#{e['code']} - #{e['uraian']}"
      end

      f.sort_by { |key| key }
      f.map do |k,v|
          if v.match(/#{parameter}/)
              selected = "selected"
          end
          option = option + '<option value="'+k+'" '+selected.to_s+'>'+v+'</option>'
      end

      return option
    end

  end

  def getProgram()

    uri = URI.parse('http://192.168.60.136:3000/fast/programs')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = false
    request = Net::HTTP::Get.new(uri.request_uri)
    request['Authorization'] = 'Bearer 4854b5b486f4159566c80d842850b967'
    response = http.request(request)

    parsed = JSON.parse(response.body)
    f = {}
    f[' -- Pilih Kode Program -- '] = ''
    parsed['result']['data'].each do |e|
      f["#{e['code']} - #{e['uraian']}"] = e.to_json
    end

    f.sort.to_h

  end

  public def getProjectParams(parameter)
    if parameter.present?
      uri = URI.parse('http://192.168.60.136:3000/commercial/projects')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = false
      request = Net::HTTP::Get.new(uri.request_uri)
      request['Authorization'] = 'Bearer 4854b5b486f4159566c80d842850b967'
      response = http.request(request)

      parsed = JSON.parse(response.body)
      option = '<option value=""></value>'
      f = {}
      parsed['result']['data'].each do |e|
        f["#{e[0]['projectCode']} - #{e[0]['projectName']}"] = "#{e[0]['projectCode']} - #{e[0]['projectName']}"
      end

      f.sort_by { |key| key }
      f.map do |k,v|
          if v.match(/#{parameter}/)
              selected = "selected"
          end
          option = option + '<option value="'+k+'" '+selected.to_s+'>'+v+'</option>'
      end

      return option
    end
  end

  def getProject()

    uri = URI.parse('http://192.168.60.136:3000/commercial/projects')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = false
    request = Net::HTTP::Get.new(uri.request_uri)
    request['Authorization'] = 'Bearer 4854b5b486f4159566c80d842850b967'
    response = http.request(request)

    parsed = JSON.parse(response.body)
    f = {}
    f[' -- Pilih Kode Proyek --'] = ''
    parsed['result']['data'].each do |e|
      f["#{e[0]['projectCode']} - #{e[0]['projectName']}"] = e.to_json
    end

    f.sort.to_h
  end

  public def getAkunPersediaanParams(parameter)
    if parameter.present?
      uri = URI.parse('http://192.168.60.136:3000/fast/akuns/akunPersediaan')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = false
      request = Net::HTTP::Get.new(uri.request_uri)
      request['Authorization'] = 'Bearer 4854b5b486f4159566c80d842850b967'
      response = http.request(request)

      parsed = JSON.parse(response.body)
      option = '<option value=""></value>'
      f = {}
      parsed['result']['data'].each do |e|
        f["#{e['kode']} - #{e['deskripsi']}"] = "#{e['kode']} - #{e['deskripsi']}"
      end

      f.sort_by { |key| key }
      f.map do |k,v|
          if v.match(/#{parameter}/)
              selected = "selected"
          end
          option = option + '<option value="'+k+'" '+selected.to_s+'>'+v+'</option>'
      end

      return option
    end
  end

  def getAkunPersediaan()

    uri = URI.parse('http://192.168.60.136:3000/fast/akuns/akunPersediaan')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = false
    request = Net::HTTP::Get.new(uri.request_uri)
    request['Authorization'] = 'Bearer 4854b5b486f4159566c80d842850b967'
    response = http.request(request)

    parsed = JSON.parse(response.body)
    f = {}
    f[' -- Pilih Kode Akun --'] = ''
    parsed['result']['data'].each do |e|
      f["#{e['kode']} - #{e['deskripsi']}"] = e.to_json
    end

    f.sort.to_h
  end


  def getVMS

    uri = URI.parse('http://pis.pgn-solution.co.id:8080/api/v1/vendors')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = false
    request = Net::HTTP::Get.new(uri.request_uri)
    request['X-Api-Key'] = 'Pg4550Lut1oN!'
    response = http.request(request)

    parsed = JSON.parse(response.body)
    f = {}
    f[''] = ''
    parsed['data'].each do |e|
      f["#{e['name']}"] = e.to_json
    end

    f.sort.to_h
  end


  def get_month_name(num)
    case num
    when 1, "1"
      return "Januari"
    when 2, "2"
      return "Februari"
    when 3, "3"
      return "Maret"
    when 4, "4"
      return "April"
    when 5, "5"
      return "Mei"
    when 6, "6"
      return "Juni"
    when 7, "7"
      return "Juli"
    when 8, "8"
      return "Agustus"
    when 9, "9"
      return "September"
    when 10, "10"
      return "Oktober"
    when 11, "11"
      return "November"
    when 12, "12"
      return "Desember"
    else
      return ""
    end
  end

  # def getKodeBiaya
  #   uri = URI.parse('http://192.168.60.136:3000/fast/programs')
  #   http = Net::HTTP.new(uri.host, uri.port)
  #   http.use_ssl = false
  #   request = Net::HTTP::Get.new(uri.request_uri)
  #   request['Authorization'] = 'Bearer 4854b5b486f4159566c80d842850b967'
  #   response = http.request(request)
  #
  #   parsed = JSON.parse(response.body)
  #   f = {}
  #   f[' -- Pilih -- '] = ''
  #   parsed['result']['data'].each do |e|
  #     f["#{e['code']} - #{e['uraian']}"] = e.to_json
  #   end
  #
  #   f.sort.to_h
  # end
end
