class Report < ApplicationRecord
  # after_create :set_filename

  belongs_to :category
  belongs_to :hotel

  mount_uploader :excel, ExcelUploader

  # def report_path
  #   ActiveStorage::Blob.service.send(:path_for, spreadsheet.key)
  # end

  # def set_filename
  #   if self.spreadsheet.attached?
  #     if self.category_id == 1
  #       self.spreadsheet.blob.update(filename: "Balance_de_#{self.date.day}_#{self.date.month}_hasta_#{self.end_date.day}_#{self.end_date.month}.#{self.spreadsheet.filename.extension}")
  #     else
  #       puts self.spreadsheet.filename.to_s
  #       self.spreadsheet.blob.update(filename: "Antiguedad_de_#{self.date.day}_#{self.date.month}_hasta_#{self.end_date.day}_#{self.end_date.month}.#{self.spreadsheet.filename.extension}")
  #       debugger
  #     end
  #   end
  # end
end
