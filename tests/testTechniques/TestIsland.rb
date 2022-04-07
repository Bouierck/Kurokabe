
require_relative "../../src/Niveau/CaseCliquable.rb"
require_relative "../../src/Niveau/CaseChiffre.rb"
require_relative "../../src/Niveau/Grille.rb"
require_relative "../../src/Niveau/Historique.rb"

historique = Historique.new

matrice = [
    [CaseCliquable.creer(0, 0, historique), CaseCliquable.creer(0, 1, historique), CaseCliquable.creer(0, 2, historique)],
    [CaseCliquable.creer(1, 0, historique), CaseChiffre.creer(1, 1, 1), CaseCliquable.creer(1, 2, historique)],
    [CaseCliquable.creer(2, 0, historique), CaseCliquable.creer(2, 1, historique), CaseCliquable.creer(2, 2, historique)]
]

