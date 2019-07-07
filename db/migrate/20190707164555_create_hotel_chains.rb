class CreateHotelChains < ActiveRecord::Migration[5.2]
  def change
    create_table :hotel_chains do |t|
      t.string :name

      t.timestamps
    end
  end
end
