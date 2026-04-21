import mysql.connector

DB_CONFIG = {
    "host": "localhost",
    "user": "root",
    "password": "Sumanyu#seth",
    "database": "crimedb",
    "raise_on_warnings": True,
    "autocommit": False
}

def get_db_connection():
    return mysql.connector.connect(**DB_CONFIG)