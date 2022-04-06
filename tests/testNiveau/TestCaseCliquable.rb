require_relative "../Test.rb"

require_relative "../../src/Niveau/CaseCliquable.rb"
require_relative "../../src/Niveau/Historique.rb"

historique = Historique.new

caseEtat0 = CaseCliquable.creer(0, 0, historique)
caseEtat1 = CaseCliquable.creer(0, 1, historique, 1)
caseEtat2 = CaseCliquable.creer(2, 3, historique, 2)

##
# Test etat de base ok !
##

Test.assert("Etat de base 0", caseEtat0.etat == 0)
Test.assert("Etat de base 1", caseEtat1.etat == 1)
Test.assert("Etat de base 2", caseEtat2.etat == 2)

##
# Changement d'etat
##

Test.assert("0 -> 1", caseEtat0.changeEtat.etat == 1)
Test.assert("1 -> 2", caseEtat1.changeEtat.etat == 2)
Test.assert("2 -> 0", caseEtat2.changeEtat.etat == 0)