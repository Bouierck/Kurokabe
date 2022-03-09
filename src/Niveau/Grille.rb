class Grille

    def Grille.creer(utilisateur, hauteur, largeur)
        new(utilisateur, hauteur, largeur)
    end

    private_class_method :new

    def initialize(utilisateur, hauteur, largeur)
        @utilisateur = utilisateur
        @matrice = Array.new(hauteur) { Array.new(largeur) { 0 } }
    end

    attr_reader :matrice

    def grilleInitilise(nomGrille)
        chemin = "../profile/" + @utilisateur.nom + "/" + nomGrille
        fichierMap = File.open(chemin)
        donneesCases = fichierMap.read.split("|")[0]
        donneesHistorique = fichierMap.read.split("|")[1]
        
        for chiffre in donneesCases do
            
        end
    end

    def grilleAfficher

    end

    def estFini
        
    end

    def compareGrille
        
    end
end