from snowflake import connector


# Snowflake
def sfconnect():
    cnx = connector.connect(
        account='',
        user='',
        password='',
        warehouse='COMPUTE_WH',
        database='DEMO_DB',
        schema='PUBLIC')
    return cnx
