class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postalcoad,    null: false
      t.string :prefecture_id, null: false
      t.string :city,          null: false
      t.string :addresses,     unll: false
      t.string :apartment
      t.string :phon_number,   null: false
      t.references :purchase,  foreign_key: true
      t.timestamps
    end
  end
end
