import psycopg2

def create_table(conn):
    with conn.cursor() as cur:
        cur.execute("""
        CREATE TABLE IF NOT EXISTS client_info (
            id SERIAL PRIMARY KEY,
            client_name VARCHAR(40),
            client_secondname VARCHAR(60),
            client_email VARCHAR(100),
            client_number INTEGER
        );
        """)


def add_client(conn, client_name: str, client_secondname: str, client_email, phones = None):
    with conn.cursor() as cur:
        cur.execute("""
        INSERT INTO client_info (client_name, client_secondname, client_email)
        VALUES (%s,%s,%s)
        RETURNING id, client_name, client_secondname, client_email;
        """, (client_name, client_secondname, client_email))


with psycopg2.connect(database = 'PythonSql', user = 'postgres', password = '134566789d') as conn:
    print(add_client(conn, 'Ilya', 'Efremov', 'ilyaefremov@mail.ru'))




conn.close()
