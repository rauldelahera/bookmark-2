--------------
User Story:

As a user,
So that I can visit my favourite websites
I would like to see a list of bookmarks
--------------

Anyone needing to setup the database from scratch will need to do the following things:

Connect to psql
Create the database using the psql command CREATE DATABASE bookmark_manager;
Connect to the database using the pqsl command \c bookmark_manager;
Run the query we have saved in the file 01_create_bookmarks_table.sql