require_relative '../Aide/Resolveur.rb'

require_relative "../Modules/dpObservateur/Observable.rb"
require_relative "../Donnees/Sauvegarde.rb"

require_relative './Grille.rb'
require_relative './Chronometre.rb'

##
# Niveau classe contenant toutes les informations du niveau
# grille, historique, chronometre, resolveur
#
class Niveau

    include Observateur

    ##
    # @id => Numero du niveau 
    # @utilisaaateur => l'utilisateur en cours sur le niveau
    # @mode => mode du niveau( classement, survie, etc..)
    # @grille => grille du niveau
    # @chrono => chronometre du niveau
    # @resolveur => resolveur du niveau
    # @historisque => historique du niveau
    
    attr_reader :chrono, :grille, :mode, :id, :utilisateur, :resolveur, :historique

    ##
    # Constructeur du niveau
    #
    # === Attributes
    #
    # * -id- numéro du niveau
    # * -utilisateur- utilisateur connecté
    # * -mode- mode du niveau
    #
    def Niveau.creer(id, utilisateur, mode)
        new(id, utilisateur, mode)
    end

    def initialize(id, utilisateur, mode)
        
        @id = id
        @utilisateur = utilisateur
        @mode = mode
        @chrono = Chronometre.creerChrono
        @resolveur = Resolveur.new
        @historique = Historique.new
        
        ##
        # Lecture du fichiers contenant les informations de la grille
        ##
        fichierMap = File.open(__dir__ + "/../../assets/levels/#{@mode}/level#{@id}.krkb")

        donnees = fichierMap.read.split("\n")
        tailleGrilleX = donnees[0].to_i
        tailleGrilleY = donnees[1].to_i
        donneesCases = donnees[2].split(" ")
        
        matrice = Array.new(tailleGrilleY) { Array.new(tailleGrilleX) { 0 } }

        x, y = 0, 0
        for chiffre in donneesCases do
            if chiffre.to_i < 0
                matrice[y][x] = (CaseCliquable.creer(x, y, @historique))
            else
                matrice[y][x] = (CaseChiffre.creer(x, y, chiffre.to_i))
            end
            x = (x+1)%tailleGrilleX
            y += 1 if x == 0
        end

        ##
        # Lecture du fichiers contenant les informations de la grille solution
        ##
        fichierMapCorrigee = File.open(__dir__ + "/../../assets/levels/#{@mode}/level#{@id}_corrige.krkb")
        donnees = fichierMapCorrigee.read.split("\n")
        tailleGrilleX = donnees[0].to_i
        tailleGrilleY = donnees[1].to_i
        donneesCases = donnees[2].split(" ")

         
        matriceCorrigee = Array.new(tailleGrilleY) { Array.new(tailleGrilleX) { 0 } }

        x, y = 0, 0
        for chiffre in donneesCases do
            if chiffre.to_i < 0
                matriceCorrigee[y][x] = (CaseCliquable.creer(x, y, @historique, chiffre.to_i.abs-1))
            else
                matriceCorrigee[y][x] = (CaseChiffre.creer(x, y, chiffre.to_i))
            end
            x = (x+1)%tailleGrilleX
            y += 1 if x == 0
        end

        #Création de la grille
        @grille = Grille.creer(matrice, matriceCorrigee)
        @grille.ajouteObservateur(self)

    end

    ##
    # Arrete le chrono du niveau si il est fini
    # Sauvegarde le niveau dans le fichier correspondant
    def update
        @chrono.on(false) if @grille.estFini?
        @chrono.grilleFini = true if @grille.estFini?
        if @grille.estFini?
            Sauvegarde.sauvNiveau(@utilisateur.nom, self, 0)
        else
            diff = ((@id - 1)/5) + 1
            Sauvegarde.sauvNiveau(@utilisateur.nom, self, Score.calculer(@resolveur.nbAppel, @chrono.timer, diff))
        end    
    end

    ##
    # Retourne la grille du niveau ainsi que le temps du chrono sous forme de texte 
    #
    def to_s
        "grille: " + @grille.to_s + " chrono: " + @chrono.to_s
    end

end