class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :restaurants, :pic_url, :image
  end
end
