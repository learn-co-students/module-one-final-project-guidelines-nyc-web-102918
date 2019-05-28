class CreateOpportunities < ActiveRecord::Migration[5.0]
  def change
    create_table :opportunities do |t|
      t.string :title
      t.string :organization
      t.string :address
      t.integer :zipcode
      t.string :category
      t.string :start_date
      t.string :end_date
      t.text :description
      t.string :url
    end
  end
end
