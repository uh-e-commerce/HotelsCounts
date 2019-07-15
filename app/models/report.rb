class Report < ApplicationRecord
  belongs_to :category
  belongs_to :hotel

  has_one_attached :spreadsheet

  def report_path
    ActiveStorage::Blob.service.send(:path_for, spreadsheet.key)
  end
end
