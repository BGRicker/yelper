class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :message
    	t.string :rating

    	t.integer :user_id
    	t.integer :place_id
     	t.timestamps
    end

    																							#indexes ensures that lookups between DBs are faster
    	add_index :comments, [:user_id, :place_id]	#lookup by user_id OR user_ID AND place_id
    	add_index :comments, :place_id							#lookup just by place_id
  end
end
