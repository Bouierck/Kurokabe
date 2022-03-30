require_relative "../Donnees/Utilisateur.rb"

require_relative "./CaseChiffre.rb"
require_relative "./CaseCliquable.rb"
require_relative "./Historique.rb"

class Grille
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
    def Grille.creer(matrice, matriceCorrigee)
        new(matrice, matriceCorigee)
    end

    private_class_method :new

    def initialize(matrice, matriceCorrigee)
        
        @historique = Historique.new
        @matrice = matrice
        @matriceCorrigee = matriceCorrigee
    
    end

    attr_reader :matrice, :matriceCorrigee, :historique

    def grilleAfficher
        
    end

    ##
    # Méthode de vérification de la validité de la grille avec le corrigé.
    #
    # @return Vrai si la grille est terminée, faux sinon
    # 
    def estFini
        if compareGrille != []
            return false
        end

        @matrice.each do |line|
            line.each do |c|
                return false if c.is_a?(CaseCliquable) && c.etat != 2  && @matriceCorrigee[c.y][c.x].etat == 2 
            end
        end
        
        puts "grille fini"
        return true
    end

    ##
    # Compare la grille courante et la correction
    #
    # @return Tableau contenant les cases éronnées
    #
    def compareGrille
        
        erreurs = []

        @matrice.each do |line|
            line.each do |c|
                erreurs.push(c) if c.is_a?(CaseCliquable) && c.etat != 0 && c.etat != @matriceCorrigee[c.y][c.x].etat
            end
        end
        
        return erreurs
        
    end

    ##
    # Affiche la grille dans le terminal pour les tests de celle-ci.
    #
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