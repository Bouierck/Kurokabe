class Grille

    def Grille.creer(utilisateur, nomGrille)
        new(utilisateur, nomGrille)
    end

    private_class_method :new

    def initialize(utilisateur, nomGrille)
        @utilisateur = utilisateur

        chemin = "../../profile/" + @utilisateur.nom + "/" + nomGrille
        fichierMap = File.open(chemin)
        tailleGrilleX = fichierMap.read.split("\n")[0]
        tailleGrilleY = fichierMap.read.split("\n")[1]
        donneesCases = fichierMap.read.split("\n")[2]
        donneesHistorique = fichierMap.read.split("\n")[3]
        
        @matrice = Array.new(tailleGrilleY) { Array.new(tailleGrilleX) { 0 } }

        int x, y = 0, 0
        for chiffre in donneesCases do
            if chiffre == -1
                @matrice[y][x] = (CaseCliquable.creer(tailleGrilleX, tailleGrilleY))
            else
                @matrice[y][x] = (CaseChiffre.creer())
            end
            x = x+1%TailleGrilleX
            y += 1 if x == 0
        end

        for histo in donneesHistorique do

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