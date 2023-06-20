This is a database optimization project. The goal of this project is to create a database and populate the database with data. We used IBM DB2 database management system and populated the database using data from Kaggle. We generated a set of queries, re-write the queries using conjunctive normal form and using the best database optimization techniques, we optimized the generated queries. More details can be found in the final report of the project.

# How to Populate the Database

The database was populated using the python code to generate SQL scripts from the tsv files. The SQL files were then run through python to populate the database.

The dataset we used is found here: https://www.kaggle.com/datasets/cynthiarempel/amazon-us-customer-reviews-dataset

Since the dataset was larger than we needed, we only used data from the following files:

- amazon_reviews_multilingual_US_v1_00.tsv
- amazon_reviews_us_Apparel_v1_00.tsv
- amazon_reviews_us_Automotive_v1_00.tsv
- amazon_reviews_us_Major_Appliances_v1_00.tsv
- amazon_reviews_us_Music_v1_00.tsv
- amazon_reviews_us_PC_v1_00.tsv
- amazon_reviews_us_Wireless_v1_00.tsv

Before running the python scripts, download each file and extract them.

To generate the SQL for each file, change the following code to the filename and table name you want to use.

```buildoutcfg
tablename = "wireless"
filename = "amazon_reviews_us_Wireless_v1_00.tsv"
```

then run ```generateTestSQL.py```.

Once the SQL has been generated, populate the database by making sure that the code in main.py points to the correct SQL file

```buildoutcfg
filename = 'wireless'
with open('SQL scripts/'+filename, 'r', encoding='utf-8') as script:
```

then run ```main.py```

Repeat process for each file to populate entire database.

Note that the time to populate each table varies depending on the size but can take up to 5 hours. Our database is already populated on the DB2 server so I suggest you just use that.

If the connection gets interrupted, the program will crash. If this happens
put a conditional statement in the for loop so that it only inserts into the database
when ```i > xxxx``` to pick up where the program crashed.