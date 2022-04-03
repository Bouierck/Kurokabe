require 'gtk3'

require_relative '../Boutons/BoutonRetour.rb'
require_relative '../Boutons/BoutonMenu.rb'

require_relative '../Donnees/Langue.rb'

##
# Widget graphique représentant l'écran d'accueil.
class MenuRegles < Gtk::Box

    attr_reader :titlebar
    def initialize(app)
        super(:vertical, 10)


        lbl = Gtk::Label.new.tap{ |label|
            label.set_markup("REGLES")
        label.show 
        }

        btnRegles = BoutonMenu.creer("TECHNIQUE", 10, 10, MenuTechnique.method(:new), app)
        btnRegles.show


        topbox=Gtk::Box.new(:vertical).tap { |boite|
            boite.pack_start(btnRegles)
            boite.pack_start(lbl)
            boite.show
        }

        self.pack_start(topbox)
        
        textLbl = Gtk::Label.new.tap{ |label|
            label.set_markup(Langue.text("regles"))
        label.show 
        }
        self.pack_start(textLbl)


            

        self.show

        @titlebar = Gtk::HeaderBar.new.tap { |barre|
                barre.title = "Nurikabe"
                barre.show_close_button = true
                barre.pack_start(BoutonRetour.new.tap { |bouton|
                    bouton.sensitive = true
                    bouton.signal_connect("clicked") { app.accueil }
                })
                barre.show
            }

    end


end