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

require_relative './src/Donnees/Langue.rb'

##
# Classe représentant le jeu assemblé
class Kurokabe < Gtk::Application

	@@app = nil
    
    ##
    # @user => utilisateur log a l'app
    # @fenetre => fenetre de l'applicaation

    attr_accessor :user, :fenetre
    
    ##
    # Retourne l'application.
    #
    # Crée l'application si elle n'existe pas.
    def Kurokabe.app
        @@app = new if(@app.nil?)
        return @@app
    end


    def initialize
    	super("projet.Kurokabe", :flags_none)

        Langue.init


        #Ajout de tous les fichiers CSS

        @provider = Gtk::CssProvider.new
        @provider.load(:path => './src/GUI/CSS/case.css')
        
        @provider2 = Gtk::CssProvider.new
        @provider2.load(:path => './src/GUI/CSS/menus.css')
        
        @provider3 = Gtk::CssProvider.new
        @provider3.load(:path => './src/GUI/CSS/regles.css')

        #Ajout avec des CSS avec les priorités
        Gdk::Screen.default.add_style_provider(@provider, 10000000)
        Gdk::Screen.default.add_style_provider(@provider2, 10000100)
        Gdk::Screen.default.add_style_provider(@provider3, 10000200)



        
        @user = nil
        
        #Création de la fenêtre
        self.signal_connect("activate") do
            @fenetre = Fenetre.new(self)
            m = MenuPrincipal.new(self)
            @fenetre.add(m)
            @fenetre.titlebar = m.titlebar
            selecteur = MenuConnexion.new(@fenetre, self)
            self.add_window(@fenetre)

            height = Gdk::Screen.height
            width = Gdk::Screen.width

            @fenetre.move(width/2-700/2, height/2-700/2)
        end
    end
    
    ##
    # Ferme le jeu
    def closeApp
        @@app.quit
    end
end # Marqueur de fin de classe

Kurokabe.app.run
