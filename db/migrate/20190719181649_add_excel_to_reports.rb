class AddExcelToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :excel, :string
  end
end
