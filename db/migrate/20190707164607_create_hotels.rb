class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :name
      t.belongs_to :hotel_chain, index: true

      t.timestamps
    end
  end
end
