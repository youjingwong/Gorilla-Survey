class CreateSurveys < ActiveRecord::Migration
  def change
  	create_table :surveys do |t|
  		t.string :title, null: false
  		t.integer :user_id, null: false
  		t.string :image_path

  		t.timestamps
  	end
  end
end
