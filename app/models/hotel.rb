class Hotel < ApplicationRecord
  belongs_to :hotel_chain
  has_many :reports
end
