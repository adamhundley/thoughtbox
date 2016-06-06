class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :links, :read?, :read
  end
end
