class RenameAddressColumn < ActiveRecord::Migration
  def change
    rename_column :trucks, :address, :user_address
  end
end
