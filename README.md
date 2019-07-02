# Oracle-Database-B-tree-index-performance
a PL-SQL script which measure several time for several requestion for evaluate time performance of Oracle Database
What do this script ?
-Create 3 table with 1000 records, 1000000 records and 10000000 records, there is random int, float, date, char(8), char(58), varchar2(8), varchar2(28)
-set up a file result.txt on root directory which will display the result of the query and the elapsed time
-set up timer for having the elapsed time
-select * from each table for each table 
-select everything from each table where clase for each datatype
-do insert, delete, update for each table with 10000 record
-create the index
-repeat

how to make int work:
In your sql plus once the database in mounted simply lauchne the script with @perf.sql

