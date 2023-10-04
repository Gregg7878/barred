class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :image_url
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :venue_name
      t.string :event_location
      t.integer :available_tickets_count
      t.references :user, null: false, foreign_key: true
      t.references :event, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
