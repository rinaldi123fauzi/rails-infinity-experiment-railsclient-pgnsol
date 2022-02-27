Rails.application.routes.draw do
  resources :returs do
    member do
      get "getPengeluaran", to: "returs#getPengeluaran"
    end
  end
  resources :sale_histories
  resources :stock_opnames
  resources :sale_items

  resources :project_items do
    member do
      get 'getNamaBarang', to: 'project_items#getNamaBarang'
    end
  end
  resources :maintenance_assets
  resources :projects
  mount Notifications::Engine => "/notifications"
  get "getKodeBiaya", to: "sales#getKodeBiaya"
  get 'notifications/index'


  resources :divisions do
    collection do
      post 'migratedivisi', to:'divisions#migrateDivisi'
    end
  end

  resources :receive_histories do
    member do
      get "detailList", to: "receive_histories#detailList"
    end
  end
  resources :divisions
  get 'items_imports/new'
  get 'items_imports/create'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users, :roles, :warehouses, :measurements, :item_groups, :divisions,
            :receive_process, :receive_kadep_supply_items

  resources :receives do
    member do
      get "getSpesifikasiBarang", to: "receives#getSpesifikasiBarang"
      get "exports", to: "receives#exports"
      # get "get_receive_data_nama_proyek", to: "receives#get_receive_data_nama_proyek"
      # get "get_kode_akun", to: "receives#get_kode_akun"
    end
  end


  resources :sales do 
    member do
      get "getNamaAkun", to: "sales#getNamaAkun"
      get "getNamaProjekOrProgram", to: "sales#getNamaProjekOrProgram"
      get "getDetailReceiveItem", to: "sales#getDetailReceiveItem"
    end
  end

  get "receives/search_kode_proyek"
  # start for autocomplete feature
  get "search_kode_proyek", to: "auto_completes#search_kode_proyek"
  get "search_kode_program", to: "auto_completes#search_kode_program"
  get "search_kode_proyek_for_project", to: "auto_completes#search_kode_proyek_for_project"
  get 'kode_proyek_for_maintenance', to: 'auto_completes#kode_proyek_for_maintenance'
  get "autocomplete/search_vendor", to: 'auto_completes#search_vendor'
  # get "search_owner", to: "auto_completes#search_owner"
  # end for autocomplete feature

  resources :receive_items do
    collection do

      get 'editSaleItem/:id', to: 'receive_items#edit_sale_item', as: 'edit_sale_item'
      patch 'updateSaleItem/:id', to: 'receive_items#update_sale_item', as: 'update_sale_item'
    end
  end

  resources :items do
    collection do
      post :import
    end
    member do
      get "tambahMasterBarang", to: "items#tambahMasterBarang"
    end
  end

  get 'detailApproval/:id', to: 'receive_process#index', as: 'detailApproval'
  get 'inputRack/:id', to: 'receive_process#input_rack', as: 'inputRack'
  get 'editRack/:id', to: 'receive_process#edit_rack', as: 'editRack'
  get 'editSaleItem/:id', to: 'sale_process#editSaleItem', as: 'editSaleItem'
  get 'editJumlahDikeluarkan/:id', to: 'sale_process#editJumlahDikeluarkan', as: 'editJumlahDikeluarkan'
  get 'receive_items/edit/:id/:receive_id',  to: 'receive_items#edit', as: 'receive_item_edit'
  post 'receive_process/setStatus'
  post 'receive_process/setLokasiPenempatan'
  post 'receive_process/printQRCode'
  post 'receive_process/setPosting'
  post 'receive_process/sendStaffGudang'
  post 'receive_process/confirmRejectKepalaGudangByAdmin'
  post 'items/saveMasterBarang'
  post 'sale_process/tambahBarang'
  post 'sale_process/updateItemBarang'
  post 'sale_process/submitUserTrading'
  post 'sale_process/updateJumlahDikeluarkan'
  post 'sale_process/submitStaffGudang'
  post 'sale_process/submitKepalaGudang'
  post 'sale_process/submitAdminPersediaan'
  post 'sale_process/submitKadepPersediaan'
  get "autocomplete/search_vendor", to: 'auto_completes#search_vendor'

  get 'receives/edit_receive_item' => 'receive_items#edit_receive_item'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
