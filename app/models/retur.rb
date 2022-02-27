class Retur < ApplicationRecord
    mount_uploaders :file, ReturUploader
end
