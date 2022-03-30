require_relative '../Aide/Resolveur.rb'

require_relative './Grille.rb'
require_relative './Chronometre.rb'

class Niveau

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
    #Constructeur du niveau
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
        
        fichierMap = File.open(__dir__ + "/../../assets/levels/#{@mode}/level#{@id}.krkb")

        donnees = fichierMap.read.split("\n")
        tailleGrilleX = donnees[0].to_i
        tailleGrilleY = donnees[1].to_i
        donneesCases = donnees[2].split(" ")
        donneesHistorique = donnees[3].split(" ")

        
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

        @grille = Grille.creer(matrice, matriceCorrigee)
        @grille.ajouteObservateur(self)

    end

    def update
        @chrono.on(false) if @grille.estFini?
        puts @grille
        Sauvegarde.sauvNiveau(@utilisateur.nom, self, @utilisateur.nbEtoiles)
    end

    def to_s
        "grille: " + @grille.to_s + " chrono: " + @chrono.to_s
    end

end