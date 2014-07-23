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


