class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :ticket, null: false, foreign_key: true
      t.integer :amount
      t.string :transaction_id
      t.string :status
      t.datetime :timestamp

      t.timestamps
    end
    add_index :payments, :transaction_id
  end
end
