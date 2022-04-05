require_relative "../Test.rb"

require_relative "../../src/Niveau/Historique.rb"
require_relative "../../src/Niveau/CaseCliquable.rb"

historique = Historique.new

case1 = CaseCliquable.creer(1, 0, historique)
case2 = CaseCliquable.creer(1, 1, historique, 1)

##
# Historique vide
##

Test.assert("Historique vide", historique.index == 0)

##
# Ajout de coups
##

historique.nouveauCoup case1.changeEtat
historique.nouveauCoup case2.changeEtat

Test.assert("Ajout de 2 coups", historique.index == 2)

##
# 1 retour en arrière
##

historique.retourArriere

Test.assert("Restour arrière", historique.index == 1 && case2.etat == 1)

##
# Test retour en avant sans nouveau coup
##

historique.retourAvant

Test.assert("Restour arrière", historique.index == 2 && case2.etat == 2 && case1.etat == 1)

##
# Test retour en avant avec nouveau coup
##

historique.nouveauCoup case1.changeEtat
historique.retourArriere
historique.retourArriere
historique.nouveauCoup case1.changeEtat
historique.retourAvant

Test.assert("Retour avant plus possible", historique.index == 2 && case2.etat == 1 && case1.etat == 2)
