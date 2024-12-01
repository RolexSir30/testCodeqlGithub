import python

/**
 * Cette requête extrait toutes les fonctions définies dans un code Python.
 */
class FunctionDefinition extends python.Function {
  FunctionDefinition() {
    // La classe "Function" représente une fonction Python définie dans le code.
    // Ici, nous laissons simplement la condition vide pour capturer toutes les fonctions.
  }
}

from FunctionDefinition f
select f.getName(), f.getDeclaringType(), f.getLocation()
