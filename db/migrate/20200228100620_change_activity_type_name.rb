class ChangeActivityTypeName < ActiveRecord::Migration[6.0]
  def change
    rename_column :activities, :type, :kind
  end
end
