class RenameUserOpportunities < ActiveRecord::Migration[5.0]
  def change
    rename_table :users_opportunities, :user_opportunities 
  end
end
