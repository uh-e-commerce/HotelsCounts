class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.datetime :date
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
