class VendorRecord < ActiveRecord::Base
    establish_connection :production_vendor
    self.abstract_class = true
end
