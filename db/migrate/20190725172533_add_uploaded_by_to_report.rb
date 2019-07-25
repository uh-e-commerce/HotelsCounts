class AddUploadedByToReport < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :uploaded_by, :string
  end
end
