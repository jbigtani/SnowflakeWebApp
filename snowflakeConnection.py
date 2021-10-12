from snowflake import connector


# Snowflake
def sfconnect():
    cnx = connector.connect(
        account='TA47544.europe-west4.gcp',
        user='jbigtani',
        password='Jit124big@',
        warehouse='COMPUTE_WH',
        database='DEMO_DB',
        schema='PUBLIC')
    return cnx
