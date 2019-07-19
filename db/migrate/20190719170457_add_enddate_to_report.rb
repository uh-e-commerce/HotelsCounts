class AddEnddateToReport < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :end_date, :datetime
  end
end
