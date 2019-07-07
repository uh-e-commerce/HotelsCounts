class AddHotelIdToReports < ActiveRecord::Migration[5.2]
  def change
    add_reference :reports, :hotel, foreign_key: true, index: true
  end
end
