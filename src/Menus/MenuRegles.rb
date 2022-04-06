require 'gtk3'

require_relative '../Boutons/BoutonRetour.rb'
require_relative '../Boutons/BoutonMenu.rb'

require_relative '../Donnees/Langue.rb'

require_relative './MenuPrincipal.rb'

##
# Widget graphique représentant l'écran d'accueil.
class MenuRegles < Gtk::Box

    attr_reader :titlebar
    def initialize(app)
        super(:vertical, 10)

        self.halign = Gtk::Align::CENTER
		app.fenetre.resize(1300,750)
        

        lbl = Gtk::Label.new.tap{ |label|
            label.set_markup(Langue.text("menuRegles"))
        label.style_context.add_class("titre1")
        label.style_context.add_class("margin-bigleft")
        label.show 
        }

        btnRegles = BoutonMenu.creer(Langue.text("voirtech"), 10, 10, MenuTechnique.method(:new), app)
        btnRegles.style_context.add_class("bouton")
        btnRegles.style_context.add_class("margin-left2")
        btnRegles.style_context.add_class("margin-right2")
        btnRegles.style_context.add_class("margin-top")
        btnRegles.show


        topbox=Gtk::Box.new(:horizontal).tap { |boite|
            boite.pack_start(lbl)
            boite.pack_start(btnRegles)
            boite.show
        }

        topbox.style_context.add_class("margin-bot")
        topbox.style_context.add_class("margin-top")

        self.pack_start(topbox)
        
        textLbl = Gtk::Label.new.tap{ |label|
            label.set_markup(Langue.text("regles"))
            label.style_context.add_class("texte")
        label.show 
        }
        self.pack_start(textLbl)
            

        self.show

        @titlebar = Gtk::HeaderBar.new.tap { |barre|
                barre.title = "Nurikabe"
                barre.show_close_button = true
                barre.pack_start(BoutonRetour.creer(MenuPrincipal.method(:new), app).tap { |bouton|
                    bouton.sensitive = true
                })
                barre.show
            }

    end


end