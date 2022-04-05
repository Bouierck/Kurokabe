require_relative "../Donnees/Utilisateur.rb"

require_relative "../Modules/dpObservateur/Observable.rb"
require_relative "../Modules/dpObservateur/Observateur.rb"

require_relative "./CaseChiffre.rb"
require_relative "./CaseCliquable.rb"

class Grille

    include Observable
    include Observateur

    ##
    # @matrice Matrice représentant la grille, composée de CaseChiffre et de CaseCliquable.
    # @matriceCorrigee Matrice représentant la grille corrigée avec les états finaux, composée de CaseChiffre et de CaseCliquable.

    attr_reader :matrice, :matriceCorrigee

    ##
    # Constructeur de Grille
    #
    # ==== Attributes
    #
    # * -matrice- matrice vide de la grille
    # * -matriceCorrigee- solution de la grille
    #
    def Grille.creer(matrice, matriceCorrigee)
        new(matrice, matriceCorrigee)
    end

    private_class_method :new

    def initialize(matrice, matriceCorrigee)
        
        @observateurs = []
        @matrice = matrice
        @matriceCorrigee = matriceCorrigee

        #Ajout au case de la grille, la grille comme observateur
        @matrice.each do |line|
            line.each do |c|
                if(c.is_a?(CaseCliquable))
                    c.ajouteObservateur(self)
                end
            end
        end
    end

    ##
    # Méthode de vérification de la validité de la grille avec le corrigé.
    # Retourne Vrai si la grille est terminée, faux sinon
    # 
    def estFini?
        if compareGrille != []
            return false
        end

        @matrice.each do |line|
            line.each do |c|
                return false if c.is_a?(CaseCliquable) && c.etat != 2  && @matriceCorrigee[c.y][c.x].etat == 2 
            end
        end
        
        return true
    end

    ##
    # Compare la grille courante et la correction
    # Retourne Tableau contenant les cases éronnées
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

    def update
        notifObservateurs
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