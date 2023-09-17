import psycopg2

def create_table(conn):
    with conn.cursor() as cur:
        cur.execute("""
        DROP TABLE client_Phone;
        DROP TABLE client_info;
        """)
        cur.execute("""
        CREATE TABLE IF NOT EXISTS client_info(
            client_id SERIAL PRIMARY KEY NOT NULL UNIQUE,
            client_name VARCHAR(40) NOT NULL UNIQUE,
            client_secondname VARCHAR(60) NOT NULL UNIQUE,  
            client_email VARCHAR(100) NOT NULL UNIQUE
        );
        """)
        conn.commit()

        cur.execute(""" 
        CREATE TABLE IF NOT EXISTS client_Phone(
            id SERIAL PRIMARY KEY,
            client_id INTEGER REFERENCES client_info(client_id),
            phone VARCHAR(12)
        );
        """)
        conn.commit()


def add_client(conn, client_name: str, client_secondname: str, client_email, phones = None):
    with conn.cursor() as cur:
        cur.execute("""
            INSERT INTO client_info (client_name, client_secondname, client_email)
            VALUES (%s,%s,%s)
            RETURNING client_id, client_name, client_secondname, client_email;
            """, (client_name, client_secondname, client_email))
        return cur.fetchone() 
    
def add_phone(conn, client_id, phone):
    with conn.cursor() as cur:
        cur.execute("""
            INSERT INTO client_Phone(client_id, phone)
            VALUES(%s, %s)
            RETURNING client_id, phone;
            """, (client_id, phone))
        return cur.fetchone()
    
def update_info(conn, client_id, client_name=None, client_secondname=None, client_email=None):
    with conn.cursor() as cur:
        cur.execute("""
            UPDATE client_info
            SET client_name=%s, client_secondname=%s, client_email=%s
            WHERE client_id=%s
            RETURNING client_name, client_secondname, client_email, client_id;
            """, (client_name, client_secondname, client_email, client_id))
        return cur.fetchone()
    
def delete_phone(conn, client_id, phone):
    with conn.cursor() as cur:
        cur.execute("""
            DELETE FROM client_Phone
            WHERE client_id=%s
            RETURNING client_id
            """, (client_id,))
        return cur.fetchone()
    
def delete_client(conn, client_id):
    with conn.cursor() as cur:
        cur.execute("""
            DELETE FROM client_info
            WHERE client_id = %s
            """, (client_id,))

def find_client(conn, client_name = None, client_secondname = None, client_email = None,phone = None):
    with conn.cursor() as cur:
        cur.execute("""
            SELECT c.client_name, c.client_secondname, c.client_email, cp.phone FROM client_info c
            LEFT JOIN client_Phone cp ON c.client_id = cp.client_id 
            WHERE c.client_name = %s or c.client_secondname = %s or c.client_email =%s or cp.phone = %s;
            """, (client_name, client_secondname, client_email, phone))
        return cur.fetchone()[0]


with psycopg2.connect(database = 'pythonsql', user = 'postgres', password = '134566789d') as conn:
    print(add_client(conn, 'Artem', 'Gerasimov', 'artem@mail.ru'))
    print(add_phone(conn, '1', '8912926460'))
    print(update_info(conn, 1, 'Artem', 'Gerasimov', 'artem12@mail.ru'))
    # print(delete_phone(conn, '1', '8912926460'))
    # print(delete_client(conn, 1))
    print(find_client(conn, 'Artem'))
    # create_table(conn)






conn.close()
