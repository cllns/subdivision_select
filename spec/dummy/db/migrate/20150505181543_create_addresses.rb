class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :subdivision

      t.timestamps null: false
    end
  end
end
