class CreateUserChoices < ActiveRecord::Migration
  def change
  	create_table :user_choices do |t|
  		t.integer :user_id, null: false
  		t.integer :choice_id, null: false

  		t.timestamps
  	end
  end
end
