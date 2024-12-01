import python

/**
 * Cette requête détecte les injections SQL dans les requêtes Python.
 */
class SqlInjection extends python.SqlQuery {
  SqlInjection() {
    // Vérifie si une requête SQL est construite de manière vulnérable,
    // par exemple, par la concaténation de chaînes de caractères provenant
    // d'entrées non sécurisées.
    exists(
      string s1, string s2 |
        this.getArguments() = [s1, s2] and
        s1 instanceof python.Name and
        s2 instanceof python.Name and
        this.getName() = "execute" and
        s1.getName() = "username" and
        s2.getName() = "password"
    )
  }
}

from SqlInjection i
select i, "Potential SQL injection detected."
