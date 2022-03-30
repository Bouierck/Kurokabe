require_relative '../Niveau/Niveau.rb'

require_relative '../Menus/Menu.rb'
require_relative '../Boutons/BoutonSpecial.rb'
require_relative '../Boutons/BoutonPause.rb'
require_relative '../Boutons/BoutonNiveau.rb'
require_relative '../Boutons/BoutonMenu.rb'

require_relative './GrilleGUI.rb'
require_relative './ChronoGUI.rb'

require 'gtk3'

class NiveauGUI < Gtk::Box

    ##
    # @niveau => niveau représenté paar ce GUI

    ##
    #Constructeur du niveau
    def NiveauGUI.creer(niveau)
        new(niveau)
    end 

    def initialize(niveau)

        super(:horizontal,2)
        @niveau = niveau
        @grilleGUI = GrilleGUI.creer(@niveau.grille)
        initGUI

    end


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
        boutonReinitialiser = BoutonSpecial.creer("↻", 2, 2, @niveau.grille.method(:resetGrille))
        boutonCheck = BoutonSpecial.creer("👁️", 2, 2, @niveau.grille.method(:compareGrille))
        boutonIndice = BoutonSpecial.creer("💡", 2, 2,self.method(:appelResoudreGrille))
        
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
        self.add(@grilleGUI)
        self.add(boxMenu)

    end

    def clickRetourArriere
        @niveau.historique.retourArriere
        @grilleGUI.updateGrille
    end

    def clickRetourAvant
        @niveau.historique.retourAvant
        @grilleGUI.updateGrille
    end

    def appelResoudreGrille
        @niveau.resolveur.resoudreGrille(@niveau.grille)
    end

    def QuitterFenetre()
        Gtk.main_quit
    end 
end
