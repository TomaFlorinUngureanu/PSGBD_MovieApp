1. We first create the dbmovies table using dbMovies_creation.sql
2. We import the data from tmdb_5000_movies.xlsx using sqlDeveloper.
3. We solve the import problems related with date format
4. We can now execute the database_creation.sql script which will create and populate
all the other tables in the database. Remember, at line 173, we can modify the value 
in the loop in order to have as many clients as we want. The more the clients, the longer
the script takes to finish!
5. Now, after everything has compiled successfully, we can execute the functions from
PSGBD_APP_SQL_Functions.txt, one by one. They are well delimited one from another.
After that, the database part should be working.
