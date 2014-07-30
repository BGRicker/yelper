== README

Q&A 

- DNS of VARIABLE.nomster.com, like www.nomster.heroku.com. Auto populate address prefix with variable
- show all places on a map, select different descriptions to cut down number of places shown

- 

- star rating for each review
- can't create new places on heroku

- is @place = Place.find(params[:place_id]) standard for locating the id of the model?
- creating alternate versions of a project on git (branches?)
- allowing user to rate without a review, making review not show up but rating factor in

- in Lesson 42 you wrote "app/views/notification_mailer/comment_added.text.erb." but I think you meant comment_added.html.erb


Previously talked about
- Count number of reviews per place, sort places as "top places' by number of reviews"

- DB queries, 


Can't create new places in heroku:

2014-07-27T22:48:36.887831+00:00 app[web.1]: [2014-07-27 22:48:36] INFO  WEBrick 1.3.1
2014-07-27T22:48:34.332739+00:00 app[web.1]: [2014-07-27 22:48:34] INFO  WEBrick::HTTPServer#start done.
2014-07-27T22:48:34.332568+00:00 app[web.1]: 	/app/vendor/ruby-2.0.0/lib/ruby/2.0.0/webrick/server.rb:170:in `block in start'
2014-07-27T22:48:34.332571+00:00 app[web.1]: 	/app/vendor/ruby-2.0.0/lib/ruby/2.0.0/webrick/server.rb:160:in `start'
2014-07-27T22:48:34.332602+00:00 app[web.1]: 	/app/vendor/bundle/ruby/2.0.0/gems/railties-4.0.1/lib/rails/commands/server.rb:84:in `start'
2014-07-27T22:48:34.332620+00:00 app[web.1]: 	/app/vendor/bundle/ruby/2.0.0/gems/railties-4.0.1/lib/rails/commands.rb:71:in `<top (required)>'
2014-07-27T22:48:34.332622+00:00 app[web.1]: 	bin/rails:4:in `<main>'
2014-07-27T22:48:34.416437+00:00 app[web.1]: F, [2014-07-27T22:45:25.690493 #2] FATAL -- : 
2014-07-27T22:48:34.416444+00:00 app[web.1]: Exiting
2014-07-27T22:48:34.332561+00:00 app[web.1]: [2014-07-27 22:48:34] FATAL SignalException: SIGTERM
2014-07-27T22:48:36.887853+00:00 app[web.1]: [2014-07-27 22:48:36] INFO  ruby 2.0.0 (2014-05-08) [x86_64-linux]
2014-07-27T22:48:34.332569+00:00 app[web.1]: 	/app/vendor/ruby-2.0.0/lib/ruby/2.0.0/webrick/server.rb:32:in `start'
2014-07-27T22:48:34.332601+00:00 app[web.1]: 	/app/vendor/bundle/ruby/2.0.0/gems/rack-1.5.2/lib/rack/server.rb:264:in `start'
2014-07-27T22:48:34.332605+00:00 app[web.1]: 	/app/vendor/bundle/ruby/2.0.0/gems/railties-4.0.1/lib/rails/commands.rb:71:in `tap'
2014-07-27T22:48:34.416432+00:00 app[web.1]: I, [2014-07-27T22:45:25.688830 #2]  INFO -- : Completed 500 Internal Server Error in 23ms
2014-07-27T22:48:34.416440+00:00 app[web.1]:   app/controllers/places_controller.rb:14:in `create'
2014-07-27T22:48:34.332566+00:00 app[web.1]: 	/app/vendor/ruby-2.0.0/lib/ruby/2.0.0/webrick/server.rb:170:in `select'
2014-07-27T22:48:34.332599+00:00 app[web.1]: 	/app/vendor/bundle/ruby/2.0.0/gems/rack-1.5.2/lib/rack/handler/webrick.rb:14:in `run'
2014-07-27T22:48:34.332604+00:00 app[web.1]: 	/app/vendor/bundle/ruby/2.0.0/gems/railties-4.0.1/lib/rails/commands.rb:76:in `block in <top (required)>'
2014-07-27T22:48:34.332684+00:00 app[web.1]: [2014-07-27 22:48:34] INFO  going to shutdown ...
2014-07-27T22:48:30.777030+00:00 heroku[web.1]: State changed from up to starting
2014-07-27T22:48:34.332621+00:00 app[web.1]: 	bin/rails:4:in `require'