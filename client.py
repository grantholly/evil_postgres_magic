import psycopg2
import asyncio

conn = psycopg2.connect(host="localhost",
                        dbname="me",
                        user="listener",
                        password="imallears")
conn.set_isolation_level(psycopg2.extensions.ISOLATION_LEVEL_AUTOCOMMIT)

cur = conn.cursor()
cur.execute("LISTEN topo;")

def handle_notification():
    conn.poll()
    for notification in conn.notifies:
        print(notification.payload)
    conn.notifies.clear()

loop = asyncio.get_event_loop()
loop.add_reader(conn, handle_notification)
loop.run_forever()
