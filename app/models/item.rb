# frozen_string_literal: true
class Item < ApplicationRecord
  belongs_to :item_group
  has_many :receive_items, dependent: :destroy
  has_many :receive, through: :receive_items, dependent: :destroy
  has_many :sales, through: :sale_items, dependent: :destroy
  # include ActiveModel::Model
  # require 'roo'

  # attr_accessor :file
  #
  # def initialize(attributes={})
  #   attributes.each { |name, value| send("#{name}=", value)}
  # end
  #
  # def persisted?
  #   false
  # end
  #
  # def open_speadsheet
  #   case File.extname(file.original_filename)
  #   when '.csv' then Csv.new(file.path, nil, :ignore)
  #   when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
  #   when '.xlsx' then Roo::Excelx.new(file.path)
  #   else raise "Unknown file type: #{file.original_filename}"
  #   end
  # end
  #
  # def load_imported_items
  #   spreadsheet = open_spreadsheet
  #   header = spreadsheet.row(5)
  #   (6..spreadsheet.last_row).map do |i|
  #     row = Hash[[header, spreadsheet.row(i)].transpose]
  #     item = Item.find_by_id(row['id']) || Item.new
  #     item.attributes = row.to_hash
  #     item
  #   end
  # end
  #
  # def imported_items
  #   @imported_items ||= load_imported_items
  # end
  #
  # def save
  #   if imported_items.map(&:valid?).all?
  #     imported_items.each(&:save!)
  #     true
  #   else
  #     imported_items.each_with_index do |item, index|
  #       item.errors.full_messages.each do |msg|
  #         errors.add :base, "Row #{index + 6}: #{msg}"
  #       end
  #     end
  #     false
  #   end
  # end

  def self.import(file)
    xlsx = Roo::excelx.new(file.tempfile)
    xlsx.each_row_streaming(offset: 1) do |row|
      item = self.new(id: row[0].value, kode_barang: row[1].value, nama_barang: row[2].value,
                      spesifikasi_barang: row[3].value, item_group_id: row[4].value, measurement_id: row[5].value)
      next if self.pluck(:id).include?(item.id)

      user.save
    end
  end

  def searchItem
    "#{self.nama_barang}, #{self.ukuran ? self.ukuran + "," : ""} #{self.tipe ? self.tipe + "," : ""} #{self.merek ? self.merek + "," : ""} #{self.serial ? self.serial + "," : ""} #{self.lain}"
  end
end
