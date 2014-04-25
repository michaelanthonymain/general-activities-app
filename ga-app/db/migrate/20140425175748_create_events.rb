class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.belongs_to :category
      t.decimal :price
      t.belongs_to :user
      t.datetime :signup_start
      t.datetime :signup_end
      t.datetime :event_start
      t.datetime :event_end
      t.boolean :uses_paypal
      t.boolean :recurring_events
      t.string :recurring_timeframe
      t.timestamps
    end
  end
end
