require_relative '../Niveau/Niveau.rb'

require_relative '../Menus/Menu.rb'
require_relative '../Boutons/BoutonSpecial.rb'
require_relative '../Boutons/BoutonPause.rb'
require_relative '../Boutons/BoutonNiveau.rb'
require_relative '../Boutons/BoutonMenu.rb'

require_relative './GrilleGUI.rb'
require_relative './ChronoGUI.rb'

require 'gtk3'

##
# Représente l'aspect graphique d'un niveau
# contient le GUI de la grille
# ainsi que les différent boutons
#
class NiveauGUI < Gtk::Box

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
    def NiveauGUI.creer(app, niveau)
        new(app, niveau)
    end 

    def initialize(app, niveau)

        super(:horizontal,2)
        
        @niveau = niveau
        @grilleGUI = GrilleGUI.creer(@niveau.grille)
        @app = app;
        initGUI

    end

    ##
    # Initialise le GUI du niveau
    #
    def initGUI

        #Box du menu
        boxMenu = Gtk::Box.new(:vertical,6)

        #label du niveau
        niveauLabel = Gtk::Label.new("Niveau #{@idNiveau}")
        chronoLabel = ChronoGUI.creer(@niveau.chrono)

        #Ajout des boutons du menu

        boutonMenu = BoutonMenu.creer("Menu", 2, 10, Menu.new)
        boutonPause = BoutonPause.creer("Pause", 2, 10, Menu.new, @niveau)
        boutonQuitter = BoutonSpecial.creer("quitter", 2, 20, self.method(:QuitterFenetre))

        #bouton fonction
        boxFonction = Gtk::Box.new(:horizontal,5)

        boutonArriere= BoutonSpecial.creer("↶", 1, 1, self.method(:clickRetourArriere))
        boutonAvant = BoutonSpecial.creer("↷", 2, 2, self.method(:clickRetourAvant))
        boutonReinitialiser = BoutonSpecial.creer("↻", 2, 2, self.method(:clickReinitialiserGrille))
        boutonCheck = BoutonSpecial.creer("👁️", 2, 2, self.method(:check))
        boutonIndice = BoutonSpecial.creer("💡", 2, 2, self.method(:appelResoudreGrille))
        
        boxFonction.add(boutonArriere)
        boxFonction.add(boutonAvant)
        boxFonction.add(boutonReinitialiser)
        boxFonction.add(boutonCheck)
        boxFonction.add(boutonIndice)

        boxMenu.add(niveauLabel)
        boxMenu.add(chronoLabel)
        boxMenu.add(boutonMenu)
        boxMenu.add(boutonPause)
        boxMenu.add(boxFonction)
        boxMenu.add(boutonQuitter)

        #Ajout des deux composant de la box du niveau
        # self.set_homogeneous(true)        
        self.add(@grilleGUI)
        self.add(boxMenu)

        chronoLabel.lancer if @niveau.grille.estFini? == false

        self.show_all

    end

    private

    ##
    # Fait un retour arrière
    # puis update l'affichage de la grille
    #
    def clickRetourArriere
        if @niveau.grille.estFini? == false
            @niveau.historique.retourArriere
            @grilleGUI.updateGrille
        end
    end

    ##
    # Fait un retour avant
    # puis update l'affichage de la grille
    #
    def clickRetourAvant
        if @niveau.grille.estFini? == false
            @niveau.historique.retourAvant
            @grilleGUI.updateGrille
        end
    end

    ##
    # Reinitialise la grille
    # puis update l'affichage de la grille
    #
    def clickReinitialiserGrille
        if @niveau.grille.estFini? == false
            @niveau.historique.reinitialiserGrille
            @grilleGUI.updateGrille
        end
    end

    ##
    # Surbrille les endroits ou il y a des erreurs
    #
    def check
        if @niveau.grille.estFini? == false
            erreurs =  @niveau.grille.compareGrille
            erreurs.each do |c|
                @grilleGUI.matriceGUI[c.y][c.x].style_context.add_class("erreur")
            end
        end
    end

    ##
    # Regarde s'il y a des techniques
    # puis update l'affichage de la grille
    #
    def appelResoudreGrille
        if @niveau.grille.estFini? == false
            indice = @niveau.resolveur.resoudreGrille(@grilleGUI.grille)
            indice.each{ |c|
                @grilleGUI.matriceGUI[c.y][c.x].style_context.add_class("indice")
            }
        end
    end

    ##
    # Quitte l'application
    #
    def QuitterFenetre()
        @app.quit
    end 
end
