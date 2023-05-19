library(DBI)
con <- dbConnect(odbc::odbc(), 
                 Driver="mysql", 
                 Server = "serverIP", 
                 Port = "3306", 
                 UID = "userName", 
                 PWD = rstudioapi::askForPassword("Database password:"), 
                 Database = "databaseName", 
                 timeout = 10)
