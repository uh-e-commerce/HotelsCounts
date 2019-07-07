class CreateAgencies < ActiveRecord::Migration[5.2]
  def change
    create_table :agencies do |t|
      t.string :name
      t.belongs_to :country, index: true

      t.timestamps
    end
  end
end
