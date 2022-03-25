require_relative "../Donnees/Utilisateur.rb"
require_relative "./CaseChiffre.rb"
require_relative "./CaseCliquable.rb"
require_relative "./Historique.rb"

class Grille < Gtk::Grid
    ##
    # @utilisateur Utilisateur propriétaire de la grille.
    # @matrice Matrice représentant la grille, composée de CaseChiffre et de CaseCliquable.
    # @matriceCorrigee Matrice représentant la grille corrigée avec les états finaux, composée de CaseChiffre et de CaseCliquable.

    ##
    # Constructeur de Grille
    #
    # ==== Attributes
    #
    # * -utilisateur- Utilisateur propriétaire de la grille
    # * -nomGrille- Nom de la grille étant le nom du fichier où se trouve la sauvegarde
    # * -mode- Mode de jeu de la grille
    #
    def Grille.creer(utilisateur, nomGrille, mode)
        new(utilisateur, nomGrille, mode)
    end

    private_class_method :new

    def initialize(utilisateur, nomGrille, mode)
        super()
        @utilisateur = utilisateur
        @historique = Historique.creer(self)
    
        fichierMap = File.open(__dir__ + "/../../profile/" + @utilisateur.nom + "/levels/" + mode + "/" + nomGrille + ".krkb")
        donnees = fichierMap.read.split("\n")
        tailleGrilleX = donnees[0].to_i
        tailleGrilleY = donnees[1].to_i
        donneesCases = donnees[2].split(" ")
        donneesHistorique = donnees[3].split(" ")

        
        @matrice = Array.new(tailleGrilleY) { Array.new(tailleGrilleX) { 0 } }

        x, y = 0, 0
        for chiffre in donneesCases do
            if chiffre.to_i < 0
                @matrice[y][x] = (CaseCliquable.creer(x, y, historique))
            else
                @matrice[y][x] = (CaseChiffre.creer(x, y, chiffre.to_i))
            end
            self.attach(@matrice[y][x], x, y, 1, 1)
            x = (x+1)%tailleGrilleX
            y += 1 if x == 0
        end

        fichierMapCorrigee = File.open(__dir__ + "/../../assets/levels/" + mode + "/" + nomGrille + "_corrige.krkb")
        donnees = fichierMapCorrigee.read.split("\n")
        tailleGrilleX = donnees[0].to_i
        tailleGrilleY = donnees[1].to_i
        donneesCases = donnees[2].split(" ")

        
        @matriceCorrigee = Array.new(tailleGrilleY) { Array.new(tailleGrilleX) { 0 } }

        x, y = 0, 0
        for chiffre in donneesCases do
            if chiffre.to_i < 0
                @matriceCorrigee[y][x] = (CaseCliquable.creer(x, y, chiffre.to_i.abs-1))
            else
                @matriceCorrigee[y][x] = (CaseChiffre.creer(x, y, chiffre.to_i))
            end
            x = (x+1)%tailleGrilleX
            y += 1 if x == 0
        end
    end

    attr_reader :matrice, :matriceCorrigee, :historique

    def grilleAfficher
        
    end

    ##
    # Méthode de vérification de la validité de la grille avec le corrigé. Renvoi vrai si la grille est
    # terminée, sinon renvoi faux.
    # 
    def estFini
        if compareGrille != []
            return false
        end
        
        for y in 0...@matrice.length do
            for x in 0...@matrice[y].length do
                return false if @matrice[y][x].is_a CaseCliquable && @matrice[y][x].etat == 0 && @matriceCorrigee[y][x].etat == 2
            end
        end
        
        return true
    end

    ##
    # Compare la grille courante et la correction et renvoi un tableau composée des cases ayant une erreur (un point au lieu d'un
    # mur ou inversement).
    #
    def compareGrille
        
        erreurs = []

        for y in 0...@matrice.length do #parcours de la matrice
            for x in 0...@matrice[y] do

                if(@matrice[y][x].is_a CaseCliquable && @matrice[y][x].etat != 0) #Si case jouable n'est pas vide
                    erreurs.push(@matrice[y][x]) if @matrice[y][x] != @matriceCorrigee[y][x] #ajout de l'erreur
                end
                
            end
        end
        
        return erreurs
        
    end

    ##
    # Affiche la grille dans le terminal pour les tests de celle-ci.
    def to_s
        string = ""
        for y in 0...@matrice.length do
            for x in 0...@matrice[y].length do
                string += @matrice[y][x].to_s + " "
            end
            string += "\n"
        end
        return string
    end

end