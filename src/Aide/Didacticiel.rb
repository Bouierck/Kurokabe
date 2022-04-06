require_relative '../GUI/NiveauGUI.rb'
require_relative '../GUI/GrilleGUI.rb'

class Didacticiel < NiveauGUI
    ##
    # @niveau => niveau représenté par ce GUI


    ##
    # Constructeur du niveau
    #
    # === Attributes
    #
    # * -app- fenetre de l'application
    # * -niveau- niveau représenté par ce GUI
    #
    def Didacticiel.creer(app, niveau)
        new(app, niveau)
    end 

    def initialize(app, niveau)

        super(app, niveau)

    end

    def initGUI
        super

        @grilleGUI.matriceGUI.each do |line|
            line.each do |c|
                c.set_sensitive(false)
            end
        end 
        @boutonMenu.set_sensitive(false)
        #@boutonPause.set_sensitive(false)
        @boutonQuitter.set_sensitive(false)

        @boutonArriere.set_sensitive(false)
        @boutonAvant.set_sensitive(false)
        @boutonReinitialiser.set_sensitive(false)
        @boutonCheck.set_sensitive(false)
        @boutonIndice.set_sensitive(false)
        
        popup(@grilleGUI.matriceGUI[0][0], "Cliquez sur une case pour changer son état.")
        @grilleGUI.matriceGUI[0][0].set_sensitive(true)

        @grilleGUI.matriceGUI[0][0].signal_connect("clicked"){
            if(@grilleGUI.matriceGUI[0][0].case.etat == 2)
                @grilleGUI.set_sensitive(false)
                popup( @boutonArriere, "Ce bouton permet de revenir un coup en arrière.")
                @boutonArriere.set_sensitive(true)
            end
        }
        

    end

    ##
    # Fait un retour arrière
    # puis update l'affichage de la grille
    #
    def clickRetourArriere
        super
        @app.signal_connect('set_focus'){}
        @boutonArriere.set_sensitive(false)
        popup(@boutonAvant, "Ce bouton permet de revenir un coup en avant.")
        @boutonAvant.set_sensitive(true)
    end

    ##
    # Fait un retour avant
    # puis update l'affichage de la grille
    #
    def clickRetourAvant
        super
        @boutonAvant.set_sensitive(false)
        popup(@boutonReinitialiser, "Ce bouton permet de réinitialisé la grille.")
        @boutonReinitialiser.set_sensitive(true)
    end

    ##
    # Reinitialise la grille
    # puis update l'affichage de la grille
    #
    def clickReinitialiserGrille
        super
        @boutonReinitialiser.set_sensitive(false)
        popup(@boutonCheck, "Ce bouton permet de regarder si vous avec des erreurs.")
        @boutonCheck.set_sensitive(true)
    end

    ##
    # Surbrille les endroits ou il y a des erreurs
    #
    def check
        super
        @boutonCheck.set_sensitive(false)
        popup(@boutonIndice, "Ce bouton te permet d'avoir un indice lorsque tu es bloqué !")
        @boutonIndice.set_sensitive(true)
    end

    ##
    # Regarde s'il y a des techniques
    # puis update l'affichage de la grille
    #
    def appelResoudreGrille
        super
        @boutonIndice.set_sensitive(false)
        popup(@boutonQuitter, "Enfin ce bouton de permet de quitter l'application.")
        @boutonQuitter.set_sensitive(true)
    end

end # Marqueur de fin de classe