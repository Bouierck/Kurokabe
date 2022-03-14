require_relative "../Donnees/Utilisateur.rb"
require_relative "./CaseChiffre.rb"
require_relative "./CaseCliquable.rb"

class Grille

    def Grille.creer(utilisateur, nomGrille)
        new(utilisateur, nomGrille)
    end

    private_class_method :new

    def initialize(utilisateur, nomGrille)
        @utilisateur = utilisateur

        chemin = __dir__ + "/../../profile/" + @utilisateur.nom + "/levels/" + nomGrille + ".krkb"
    
        fichierMap = File.open(chemin)
        donnees = fichierMap.read.split("\n")
        tailleGrilleX = donnees[0].to_i
        tailleGrilleY = donnees[1].to_i
        donneesCases = donnees[2].split(" ")
        donneesHistorique = donnees[3].split(" ")

        
        @matrice = Array.new(tailleGrilleY) { Array.new(tailleGrilleX) { 0 } }

        x, y = 0, 0
        for chiffre in donneesCases do
            if chiffre.to_i < 0
                @matrice[y][x] = (CaseCliquable.creer(x, y))
            else
                @matrice[y][x] = (CaseChiffre.creer(x, y, chiffre.to_i))
            end
            x = (x+1)%tailleGrilleX
            y += 1 if x == 0
        end
    end

    attr_reader :matrice

    def grilleAfficher

    end

    def estFini
        
    end

    def compareGrille
        
    end
end