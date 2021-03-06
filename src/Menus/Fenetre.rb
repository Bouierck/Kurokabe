##
# Auteur LeNomDeLEtudiant
# Version 0.1 : Date : Wed Mar 30 11:36:35 CEST 2022
#

require 'gtk3'

    ##
    # Fenêtre principale de l'application
class Fenetre < Gtk::Window
        
    ##
    # Crée une fenêtre principale.
    #
    # Paramètres :
    # [+app+]   Application (Kurokabe)
    def initialize(app)
        super()
        self.style_context.add_class("bg")
        self.default_width = 300
        self.default_height = 500
        self.icon_name = "applications-games"
        self.titlebar = Gtk::HeaderBar.new.tap { |barre_titre|              
            barre_titre.title = "Kurokabe"
            barre_titre.show_close_button = true
            barre_titre.show
        }
        self.signal_connect("destroy") {
            app.quit
        }
        self.show
    end
end
