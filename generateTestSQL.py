import csv
import sys


def double_apostrophes(text):
    substring = text
    result = ""
    while substring.find("'") >= 0:
        result += substring[:substring.find("'")] + "''"
        substring = substring[substring.find("'")+1:]

    result += substring
    return result


maxInt = sys.maxsize
tablename = "wireless"
filename = "amazon_reviews_us_Wireless_v1_00.tsv"

while True:
    try:
        csv.field_size_limit(maxInt)
        break
    except OverflowError:
        maxInt = int(maxInt/10)


with open(filename, encoding="utf-8") as tsv:
    rd = csv.reader(tsv, delimiter="\t", quotechar='"')
    i = 0
    with open("SQL scripts/" + tablename, 'w', encoding='utf-8') as write_to_file:
        write_to_file.write("drop table " + tablename + ";\n\n")
        write_to_file.write("create table " + tablename + " ("
                            "marketplace varchar(10),"
                            "customer_id bigint not null,"
                            "review_id varchar(50) primary key not null,"
                            "product_id varchar(50),"
                            "product_parent bigint,"
                            "product_title varchar(1000),"
                            "product_category varchar(50),"
                            "star_rating int,"
                            "helpful_votes int,"
                            "total_votes int,"
                            "vine varchar(50),"
                            "verified_purchase varchar(50),"
                            "review_headline varchar(1000),"
                            "review_body clob,"
                            "review_date date);\n\n")
        write_to_file.write("insert into " + tablename + " (marketplace, customer_id, review_id, product_id,"
                            "product_parent, product_title, product_category, star_rating, helpful_votes,"
                            "total_votes, vine, verified_purchase ,review_headline, review_body, review_date) values\n")
        for row in rd:
            i += 1
            if i > 1 and len(row) == 15:
                marketplace = row[0]
                customer_id = int(row[1])
                review_id = row[2]
                product_id = row[3]
                product_parent = int(row[4])

                product_title = double_apostrophes(row[5])

                product_category = row[6]
                star_rating = int(row[7])
                helpful_votes = int(row[8])
                total_votes = int(row[9])
                if row[10] == 'N':
                    vine = 'false'
                elif row[10] == 'Y':
                    vine = 'true'
                else:
                    vine = row[10]

                if row[11] == 'N':
                    verified = 'false'
                elif row[11] == 'Y':
                    verified = 'true'
                else:
                    verified = row[11]

                review_headline = double_apostrophes(row[12])
                review_body = double_apostrophes(row[13])
                review_date = row[14]

                write_to_file.write(f"('{marketplace}',{customer_id},'{review_id}','{product_id}',"
                                    f"'{product_parent}','{product_title}','{product_category}',{star_rating},"
                                    f"{helpful_votes},{total_votes},"
                                    f"{vine},{verified},'{review_headline}','{review_body}','{review_date}')")
                if i % 80 == 0:
                    write_to_file.write(";\n")
                    write_to_file.write("insert into " + tablename + " (marketplace, customer_id, review_id, "
                                        "product_id,"
                                        " product_parent, product_title, product_category, star_rating, helpful_votes,"
                                        " total_votes,vine, verified_purchase ,review_headline, review_body,review_date"
                                        ") values\n")
                else:
                    write_to_file.write(",\n")

            if i % 100000 == 0:
                print(i)
