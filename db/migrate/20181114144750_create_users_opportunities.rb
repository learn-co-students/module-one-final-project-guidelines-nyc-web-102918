class CreateUsersOpportunities < ActiveRecord::Migration[5.0]
  def change
    create_table :users_opportunities do |t|
      t.integer :user_id
      t.integer :opportunity_id
    end 
  end
end
