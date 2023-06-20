import ibm_db
import time

conn = ibm_db.connect(
    "DATABASE=cs43826;"
    "HOSTNAME=neptunium.cs.umanitoba.ca;"
    "PORT=50000;PROTOCOL=TCPIP;UID=mcdonelc;"
    "PWD=7940861", "", "")
conn_state = ibm_db.active(conn)
print(conn_state)
sql_statement = ""
start_time = time.time()
filename = 'wireless'
with open('SQL scripts/'+filename, 'r', encoding='utf-8') as script:
    line = script.readline()
    i = 0
    while line:
        i += 1
        sql_statement += line
        if line.find(";", len(line)-3, len(line)) >= 0:
            statement = ibm_db.prepare(conn, sql_statement)
            try:
                # print(sql_statement)
                print(i)
                ibm_db.execute(statement)
            except:
                print(ibm_db.stmt_errormsg())
                # sql_lines = sql_statement.split('\n')
                # insert_into = sql_lines[1]
                # values = sql_lines[2:]
                # for value in values:
                #     statement_str = insert_into + value[:len(value)-1]
                #     statement = ibm_db.prepare(conn, sql_statement)
                #     try:
                #         ibm_db.execute(statement)
                #     except:
                #         print(ibm_db.stmt_errormsg())
                #         print(value)
            sql_statement = ""
        line = script.readline()


ibm_db.close(conn)
print("--- %s seconds ---" % (time.time() - start_time))

