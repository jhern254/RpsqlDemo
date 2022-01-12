# useful links: https://nuitrcs.github.io/databases_workshop/r/r_databases.html
#library(RPostgres) # don't need if using DBI
library(DBI)
library(dplyr)
#require(RPostgreSQL)
 
# Hard code credentials bad practice, temp for now. See env. vars or .pgpass file
# set up DB vars
db <- 'rpostgres'
host_db <- 'localhost'
db_port <- '5432'
db_user <- 'jun'
db_password <- 'jose53'

# connect DB
con <- dbConnect(RPostgres::Postgres(), dbname=db, host=host_db, port=db_port,
                 user=db_user, password=db_password)
# list tables
dbListTables(con)

dbListFields(con, "dodgers")

# ex. psql query 
res <- dbSendQuery(con, "SELECT * FROM dodgers LIMIT 5")
dbFetch(res)

#str(res)

# clear result after calling dbSendQuery
dbClearResult(res)

# ReadTable is also SELECT *
res <- dbReadTable(con, "dodgers")
head(res)

# parameterized query, use $1 to reference args 
myquery <- dbSendQuery(con, "SELECT * FROM dodgers WHERE month = $1")
dbBind(myquery, list('APR'))
dbFetch(myquery)

# clear
dbClearResult(myquery)


# CAN ONLY RUN ONCE TO CREATE TABLE
if(FALSE) {
# Write new table to psql from dataframe
    mytbl <- data.frame(number=1:10, letter=LETTERS[1:10])
    dbWriteTable(conn=con, name="mynewtable", value=mytbl)
# turn overwrite and append TRUE?

    dbListTables(con)
    res <- dbSendQuery(con, "SELECT * FROM mynewtable")
    dbFetch(res)

    dbClearResult(res)
}

# remove table - RUN ONCE
if(FALSE) {
    dbRemoveTable(con, "mynewtable")
    dbListTables(con)
}



# Psql Transactions: dbBegin, dbRollback, dbCommit
if(FALSE) {
    dbBegin(con)
    dbWriteTable(con, "mynewtable", mytbl)
    dbRollback(con)
    dbGetQuery(con, "SELECT * FROM mynewtable")     
}



# -----
# dplyr
# get reference to table
dodgerstbl <- tbl(con, "dodgers")
str(dodgerstbl)
head(dodgerstbl)

dodgerstbl %>%
    filter(month %in% 'JUN') %>%
    show_query()









# close connection - good practice
dbDisconnect(con)





