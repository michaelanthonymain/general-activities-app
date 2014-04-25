class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
	    t.boolean  :is_admin,    default: false
	    t.string   :name
	    t.string   :email
	    t.string   :cohort
	    t.string   :avatar_url
	    t.string   :oauth_token
	    
	    t.timestamps
    end
  end
end
