class RemoveRouteFromReports < ActiveRecord::Migration[5.2]
  def change
    remove_column :reports, :route, :string
  end
end
