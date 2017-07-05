class CreateStateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :state_transactions do |t|
      t.string :street
      t.string :city
      t.string :zip
      t.string :state
      t.integer :beds
      t.integer :baths
      t.integer :sq_feet
      t.integer :prop_type
      t.datetime :sale_date
      t.decimal :price
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
