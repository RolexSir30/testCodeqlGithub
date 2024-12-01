import sqlite3

def get_user_data(username, password):
    # Connexion à la base de données SQLite
    conn = sqlite3.connect('users.db')
    cursor = conn.cursor()

    # Constructeur de requête SQL vulnérable à l'injection SQL
    query = f"SELECT * FROM users WHERE username = '{username}' AND password = '{password}'"
    
    # Exécution de la requête
    cursor.execute(query)
    
    # Récupération des résultats
    result = cursor.fetchall()
    
    # Fermeture de la connexion
    conn.close()
    
    return result

# Fonction principale
def main():
    username = input("Enter username: ")
    password = input("Enter password: ")

    user_data = get_user_data(username, password)

    if user_data:
        print("Login successful!")
    else:
        print("Invalid credentials!")

if __name__ == "__main__":
    main()
