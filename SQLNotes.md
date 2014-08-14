SELECT places.id, COUNT(*), AVG(rating)  FROM places JOIN comments ON(comments.place_id=  places.id) GROUP BY places.id;
 id | count |        avg         
----+-------+--------------------
 26 |     3 | 3.3333333333333333
 18 |     3 | 2.0000000000000000
(2 rows)




SELECT places.id  FROM places JOIN comments ON(comments.place_id=  places.id) GROUP BY places.id;
 id 
----
 26
 18
(2 rows)



SELECT places.id, places.name, comments.rating FROM places JOIN comments ON(comments.place_id=  places.id);
 id |     name      | rating 
----+---------------+--------
 18 | Casa Razdora  |      1
 18 | Casa Razdora  |      2
 18 | Casa Razdora  |      3
 26 | Test Location |      4
 26 | Test Location |      5
 26 | Test Location |      1
(6 rows)


SELECT id, name FROM places;
 id |          name           
----+-------------------------
 14 | Ken's apartment
 18 | Casa Razdora
 19 | Galleria Umberto
 20 | Santarpio’s Pizza
 21 | Regina Pizzeria
 22 | Ernesto’s
 23 | Captain Hooks
 24 | Hamilton House of Pizza
 25 | Santarpio’s Pizza
 26 | Test Location
(10 rows)



SELECT AVG("comments"."rating") AS avg_id FROM "comments" WHERE "comments"."place_id" = 26
=> 3.3333333333333335



SELECT "comments".* FROM "comments" WHERE "comments"."place_id" = 26	#loads comments from that place


SELECT AVG(rating), MIN(rating) FROM comments WHERE place_id=26;
        avg         | min 
--------------------+-----
 3.3333333333333333 |   1
(1 row)


SELECT AVG(rating) FROM comments WHERE place_id=26;
        avg         
--------------------
 3.3333333333333333
(1 row)



SELECT rating FROM comments WHERE place_id=26;
 rating 
--------
      4
      5
      1
(3 rows)



SELECT * FROM users WHERE email="email@email.com"                   


SELECT * FROM users JOIN places ON (users.id = places.user_id) WHERE email="ken@thefirehoseproject.com";


SELECT count(comments.id), places.id, comments.id is not null FROM places JOIN users ON (users.id  = places.user_id) LEFT OUTER JOIN comments ON (comments.place_id = places.id) group BY places.id,comments.id is not null;

 count | id | ?column? 
-------+----+----------
     7 | 18 | t
     6 | 27 | t
     0 | 24 | f
     2 | 20 | t
     0 | 21 | f
     0 | 22 | f
     2 | 23 | t
     7 | 26 | t
     0 | 14 | f
     1 | 19 | t
(10 rows)



********

- find_by
User.find_by! id: '1'					#finds user with id of 1
Comment.find_by! user_id: '1'			#finds comment by user id 1

- find, multiple primary keys
Place.find(14,26)						#finds places with primary_keys of 14 and 26 (ids of 14, 26)

User.take!								#retrieves record with no implicit ordering
Place.take(2)							#takes two places, no implicit ordering

User.first(2)							#returns two first users, also callable as last

User.find_each do |user|				#find_each retrieves batch of records (1000 by default)
	Newsletter.weekly_deliver(user)		#yields each record to block operation
end

User.find_each(batch_size: 5000) do |user|			#(batch_size: #) sets batch size for the records retrieval

" " (start: 2000, batch_size: 5000) do |user|		#defines start point of insertions by primary key (default asc)
													#starts, then continues batch size, e.g. 2000 - 7000


# Give add_invoices an array of 1000 invoices at a time			#
Invoice.find_in_batches(include: :invoice_lines) do |invoices|	#
  export.add_invoices(invoices)									# accepts bath_size and start options
end

User.find_by email: 'bgricker@gmail.com' 						#find User by an email that is bgricker@gmail.com

User.find([1,2])												#finds two records

User.take(2)													#returns 2 Users, no explicit ordering (what order are these pulled in?)

Place.where("user_id = '1'")									#returns user_id 1's Places

Comment.where("user_id = '1' AND rating = '5'")					#user_id's 5 star ratings
















