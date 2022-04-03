require_relative '../Test.rb'

require_relative '../../src/Niveau/Grille.rb'
require_relative '../../src/Niveau/CaseCliquable.rb'
require_relative '../../src/Niveau/CaseChiffre.rb'
require_relative '../../src/Niveau/Historique.rb'


historique = Historique.new

matriceVide = [	[CaseCliquable.creer(0, 0, historique), CaseCliquable.creer(1, 0, historique), CaseCliquable.creer(2, 0, historique), CaseChiffre.creer(3, 0, 1)],
			[CaseCliquable.creer(0, 1, historique), CaseChiffre.creer(1, 1, 4), CaseCliquable.creer(2, 1, historique), CaseCliquable.creer(3, 1, historique)],
			[CaseCliquable.creer(0, 2, historique), CaseCliquable.creer(1, 2, historique), CaseChiffre.creer(2, 2, 1), CaseCliquable.creer(3, 2, historique)],
			[CaseChiffre.creer(0, 3, 1), CaseCliquable.creer(1, 3, historique), CaseCliquable.creer(2, 3, historique), CaseCliquable.creer(3, 3, historique)]]

matriceErreurs = [[CaseCliquable.creer(0, 0, historique, 3), CaseCliquable.creer(1, 0, historique), CaseCliquable.creer(2, 0, historique), CaseChiffre.creer(3, 0, 1)],
			[CaseCliquable.creer(0, 1, historique), CaseChiffre.creer(1, 1, 4), CaseCliquable.creer(2, 1, historique), CaseCliquable.creer(3, 1, historique, 2)],
			[CaseCliquable.creer(0, 2, historique), CaseCliquable.creer(1, 2, historique), CaseChiffre.creer(2, 2, 1), CaseCliquable.creer(3, 2, historique)],
			[CaseChiffre.creer(0, 3, 1), CaseCliquable.creer(1, 3, historique), CaseCliquable.creer(2, 3, historique), CaseCliquable.creer(3, 3, historique)]]

matriceFini = [[CaseCliquable.creer(0, 0, historique, 1), CaseCliquable.creer(1, 0, historique), CaseCliquable.creer(2, 0, historique, 2), CaseChiffre.creer(3, 0, 1)],
			[CaseCliquable.creer(0, 1, historique), CaseChiffre.creer(1, 1, 4), CaseCliquable.creer(2, 1, historique, 2), CaseCliquable.creer(3, 1, historique, 2)],
			[CaseCliquable.creer(0, 2, historique, 2), CaseCliquable.creer(1, 2, historique, 2), CaseChiffre.creer(2, 2, 1), CaseCliquable.creer(3, 2, historique, 2)],
			[CaseChiffre.creer(0, 3, 1), CaseCliquable.creer(1, 3, historique, 2), CaseCliquable.creer(2, 3, historique, 2), CaseCliquable.creer(3, 3, historique, 2)]]

matriceC = [[CaseCliquable.creer(0, 0, historique, 1), CaseCliquable.creer(1, 0, historique, 1), CaseCliquable.creer(2, 0, historique, 2), CaseChiffre.creer(3, 0, 1)],
			[CaseCliquable.creer(0, 1, historique, 1), CaseChiffre.creer(1, 1, 4), CaseCliquable.creer(2, 1, historique, 2), CaseCliquable.creer(3, 1, historique, 2)],
			[CaseCliquable.creer(0, 2, historique, 2), CaseCliquable.creer(1, 2, historique, 2), CaseChiffre.creer(2, 2, 1), CaseCliquable.creer(3, 2, historique, 2)],
			[CaseChiffre.creer(0, 3, 1), CaseCliquable.creer(1, 3, historique, 2), CaseCliquable.creer(2, 3, historique, 2), CaseCliquable.creer(3, 3, historique, 2)]]

grilleVide = Grille.creer(matriceVide, matriceC)
grilleErreur = Grille.creer(matriceErreurs, matriceC)
grilleFini = Grille.creer(matriceFini, matriceC)

##
# Test grille pas fini
##

Test.assert(1, grilleVide.estFini? == false)

##
# Test erreurs sur grille sans erreurs
##

Test.assert(2, grilleVide.compareGrille.empty? == true)


##
# Test erreurs sur grille avec erreurs
##

Test.assert(2, grilleErreur.compareGrille.empty? == false)

##
# Test grille fini avec grille fini
##

Test.assert(3, grilleFini.estFini?)