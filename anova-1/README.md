### Anova Test

To run Anova sample from [this R tutorial](http://www.r-tutor.com/elementary-statistics/analysis-variance/factorial-design). 
After running the test you will have these files
  * anova-1/anova-1.in.R
  * anova-1/anova-1.csv
  * anova-1/anova-1.sql
  * anova-1/anova-1.sqlite
  * anova-1/anova-1.out.txt

0. Working from the anova-1 directory...
1. Create db schema in anova-1.sql

  ```
  CREATE TABLE SALES (
    LOCATION VARCHAR(255),
    ITEM1 INT,
    ITEM2 INT,
    ITEM3 INT
  );

  ```
2. Create the data in anova-1.csv (you could do this in Excel if you like, saving as a .csv)

  ```
  E1,25,39,36
  E2,36,42,24
  E3,31,39,28
  E4,26,35,29
  W1,51,43,42
  W2,47,39,36
  W3,47,53,32
  W4,52,46,33

  ```

3. Create the db

  ```
  > sqlite3
  sqlite> .read anova-1.sql # read the script from anova-1.sql
  sqlite> .save 'anova-1.sqlite' # save the db in the file anova-1.sqlite
  sqlite> .import 'anova-1.csv' SALES # insert the rows in SALES
  sqlite> .quit # quit sqlite
  ```

4. Run the R commands (see the script in anova-1.in.R for the actual commands)
  ```
  > R
  R> source("anova-1.in.R") # run the script in anova-1.in.R
  R> q() # quit 
  ```   
5. You should now have the ANOVA summary table printed to anova-1.out.txt

