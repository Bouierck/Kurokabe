require_relative '../Test.rb'

require_relative '../../src/Niveau/Score.rb'

##
# niveau 3 etoiles
Test.assert("Facile full etoiles", Score.calculer(8, 299, 1) == 3)
Test.assert("Moyen full etoiles", Score.calculer(5, 449, 2) == 3)
Test.assert("Difficile full etoiles", Score.calculer(1, 600, 3) == 3)

##
# Temps impartit pas respecté
Test.assert("Facile full etoiles", Score.calculer(8, 301, 1) == 2)
Test.assert("Moyen full etoiles", Score.calculer(5, 800, 2) == 2)
Test.assert("Difficile full etoiles", Score.calculer(1, 602, 3) == 2)

##
# Nombre de techniques pas respecté
Test.assert("Facile full etoiles", Score.calculer(11, 299, 1) == 2)
Test.assert("Moyen full etoiles", Score.calculer(6, 449, 2) == 2)
Test.assert("Difficile full etoiles", Score.calculer(3, 599, 3) == 2)

##
# Niveau 1 etoiles
Test.assert("Facile full etoiles", Score.calculer(11, 400, 1) == 1)
Test.assert("Moyen full etoiles", Score.calculer(6, 500, 2) == 1)
Test.assert("Difficile full etoiles", Score.calculer(3, 601, 3) == 1)