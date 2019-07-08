class Report < ApplicationRecord
  belongs_to :category
  belongs_to :hotel

  has_one_attached :spreadsheet
end
