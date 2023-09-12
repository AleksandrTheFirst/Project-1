import psycopg2

def create_table(conn):
    with conn.cursor() as cur:
        cur.execute("""
        DROP TABLE client_Phone;
        DROP TABLE client_info;
        """)
        cur.execute("""
        CREATE TABLE IF NOT EXISTS client_info(
            id SERIAL PRIMARY KEY NOT NULL UNIQUE,
            client_name VARCHAR(40) NOT NULL UNIQUE,
            client_secondname VARCHAR(60) NOT NULL UNIQUE,  
            client_email VARCHAR(100) NOT NULL UNIQUE
        );
        """)
        conn.commit()

        cur.execute(""" 
        CREATE TABLE IF NOT EXISTS client_Phone(
            id INTEGER references client_info(id),
            phone_number DECIMAL UNIQUE
        );
        """)
        conn.commit()


def add_client(conn, client_name: str, client_secondname: str, client_email, phones = None):
    with conn.cursor() as cur:
        cur.execute("""
            INSERT INTO client_info (client_name, client_secondname, client_email)
            VALUES (%s,%s,%s)
            RETURNING id, client_name, client_secondname, client_email;
            """, (client_name, client_secondname, client_email))
        return cur.fetchone() 
    
def add_phone(conn, id, phone_number):
    with conn.cursor() as cur:
        cur.execute("""
            INSERT INTO client_Phone(id, phone_number)
            VALUES(%s, %s)
            RETURNING id, phone_number;
            """, (id, phone_number))
        return cur.fetchone()
    
def update_info(conn, id, client_name=None, client_secondname=None, client_email=None):
    with conn.cursor() as cur:
        cur.execute("""
            UPDATE CLIENT
            SET client_name=%s, client_secondname=%s, client_email=%s;
            WHERE id=%s
            RETURNING id, client_name, client_secondname, client_email;
            """, (id, client_name, client_secondname, client_email))
        return cur.fetchone()



with psycopg2.connect(database = 'PythonSql', user = 'postgres', password = '134566789d') as conn:
    print(add_client(conn, 'Artem', 'Gerasimov', 'artem@mail.ru'))
    print(add_phone(conn, '1', '8912926460'))
    print(update_info(conn, '1', 'Artem', 'Gerasimov', 'artem12@mail.ru'))
    # create_table(conn)





conn.close()
