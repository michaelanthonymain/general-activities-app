class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :is_admin
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :cohort
      t.string :oauth_token

      t.timestamps
    end
  end
end
