class AlterCommentsSetRatingsToInteger < ActiveRecord::Migration
  def change
  	remove_column :comments, :rating
  	add_column :comments, :rating, :integer
  end
end


# SELECT AVG(rating), MIN(rating) FROM comments WHERE place_id=26;26
