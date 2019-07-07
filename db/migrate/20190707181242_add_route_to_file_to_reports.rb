class AddRouteToFileToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :route, :string
  end
end
