class RemoveZipFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :zipcode
  end
end
