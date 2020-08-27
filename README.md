# Forum_application
  Application where user can ask questions by creating new thread, search for threads and add comments on ongoing threads.
  Topic can be marked as closed if responder chooses to select a status closed when posting a reply.

* Basic setup
  1. Ruby version - Ruby 2.3.4
  2. Rails version - Rails 5.2.4.3
  3. Postgres versions - (PostgreSQL) 12.3
  
* Application setup
   bundle install
 
* Setup DB migration
  rails db:migrate

* Load the sample json data
  1. Load User data 
     rake load_users_data path_to_users_json_file
  2. Load Topics data
     rake load_topics_data path_to_topics_json_file
  3. Load comment data for a topic
     rake load_comments_data path_to_comments_json_file

* Run the application
  rails server