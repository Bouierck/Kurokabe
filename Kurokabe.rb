##
# Auteur LeNomDeLEtudiant
# Version 0.1 : Date : Wed Mar 30 11:31:00 CEST 2022
#

require 'gtk3'
require_relative './src/Menus/Fenetre.rb'
require_relative './src/Menus/MenuPrincipal.rb'
require_relative './src/Menus/MenuNiveaux.rb'
require_relative './src/Menus/MenuConnexion.rb'
require_relative './src/Menus/MenuRegles.rb'
require_relative './src/Menus/MenuTechnique.rb'
#require_relative 'MenuRegles'

class Kurokabe < Gtk::Application

	@@app = nil
    
    # @grille_actuelle  => GrilleJouable actuelle
    # @historique       => Historique de la grille actuelle

    ##
    # Retourne l'application.
    #
    # Crée l'application si elle n'existe pas.
    def Kurokabe.app
        @@app = new if(@app.nil?)
        return @@app
    end


    def initialize
    	super("projet.Nurikabe", :flags_none)

        @provider = Gtk::CssProvider.new
        @provider.load(:path => './src/GUI/CSS/case.css')

        Gdk::Screen.default.add_style_provider(@provider, 10000000)

        self.signal_connect("activate") do
            @fenetre = Fenetre.new(self)
            self.accueil
            selecteur = MenuConnexion.new(@fenetre, self)
            self.add_window(@fenetre)
        end
    end
 

    def accueil
        accueil = MenuPrincipal.new(self)
        @fenetre.remove(@fenetre.child) if(@fenetre.child)
        @fenetre.child = accueil
        @fenetre.titlebar = accueil.titlebar
        return self
    end

    def menus
        menu = MenuNiveaux.new(self)
        @fenetre.remove(@fenetre.child) if(@fenetre.child)
        @fenetre.child = menu
        @fenetre.titlebar = menu.titlebar
        return self
    end

    def lanceNiveau(niveau)
        @fenetre.remove(@fenetre.child) if(@fenetre.child)
        @fenetre.child = niveau
        return self
    end

    def regles  
        regle = MenuRegles.new(self)
        @fenetre.remove(@fenetre.child) if(@fenetre.child)
        @fenetre.child = regle
        @fenetre.titlebar = regle.titlebar
        return self
    end

    def techniquemenus
        techniquemenu = MenuTechnique.new(self)
        @fenetre.remove(@fenetre.child) if(@fenetre.child)
        @fenetre.child = techniquemenu
        @fenetre.titlebar = techniquemenu.titlebar
        return self
    end
    
    def closeApp
        @@app.quit
    end
end # Marqueur de fin de classe

Kurokabe.app.run
