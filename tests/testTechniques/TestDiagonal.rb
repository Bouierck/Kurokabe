require_relative '../Test.rb'

require_relative "../../src/Niveau/CaseCliquable.rb"
require_relative "../../src/Niveau/CaseChiffre.rb"
require_relative "../../src/Niveau/Grille.rb"
require_relative "../../src/Niveau/Historique.rb"

require_relative "../../src/Aide/Techniques/Diagonal.rb"

require_relative '../../src/Donnees/Langue.rb'

Langue.init

historique = Historique.new

tech = Diagonal.new

matrice = [
    [CaseChiffre.creer(0, 0, 5), CaseCliquable.creer(0, 1, historique), CaseCliquable.creer(0, 2, historique)],
    [CaseCliquable.creer(1, 0, historique), CaseChiffre.creer(1, 1, 4), CaseCliquable.creer(1, 2, historique)],
    [CaseCliquable.creer(2, 0, historique), CaseCliquable.creer(2, 1, historique, 1), CaseCliquable.creer(2, 2, historique)]
]

grille = Grille.creer(matrice, matrice)

Test.assert("Technique trouvé", tech.verifieTech(grille) == true)

matrice = [
    [CaseChiffre.creer(0, 0, 5), CaseCliquable.creer(0, 1, historique, 1), CaseCliquable.creer(0, 2, historique)],
    [CaseCliquable.creer(1, 0, historique), CaseCliquable.creer(1, 1, historique), CaseCliquable.creer(1, 2, historique)],
    [CaseCliquable.creer(2, 0, historique), CaseCliquable.creer(2, 1, historique), CaseChiffre.creer(2, 2, 4)]
]

grille = Grille.creer(matrice, matrice)

Test.assert("Technique non trouvé", tech.verifieTech(grille) == false)