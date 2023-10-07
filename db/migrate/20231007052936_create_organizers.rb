class CreateOrganizers < ActiveRecord::Migration[7.0]
  def change
    create_table :organizers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :age
      t.string :password_digest

      t.timestamps
    end
  end
end
