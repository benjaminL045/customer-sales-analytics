import os
from dotenv import load_dotenv
from sqlalchemy import create_engine

load_dotenv()

def get_connection():

    connection_string = (
        f"postgresql://"
        f"{os.getenv('DB_USER')}:"
        f"{os.getenv('DB_PASSWORD')}@"
        f"{os.getenv('DB_HOST')}:"
        f"{os.getenv('DB_PORT')}/"
        f"{os.getenv('DB_NAME')}"
    )

    return create_engine(connection_string)


if __name__ == "__main__":

    engine = get_connection()

    try:
        with engine.connect() as connection:
            print("Database connected successfully!")

    except Exception as e:
        print("Connection failed:")
        print(e)