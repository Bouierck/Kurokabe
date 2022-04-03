require 'gtk3'
require_relative '../Boutons/BoutonRetour.rb'
require_relative '../Boutons/BoutonMenu.rb'
require_relative '../Boutons/BoutonLangue.rb'

require_relative '../Donnees/Langue.rb'

    ##
    # Widget graphique représentant l'écran d'accueil.
    class MenuPrincipal < Gtk::Box
        
        attr_reader :titlebar
        
        ##
        # Méthode permettant de créer l'écran d'accueil.
        #
        # Paramètres :
        # [+app+]   Application (Nurikabe)
        def initialize(app)
            super(:vertical, 10)
            
            self.valign = Gtk::Align::CENTER
            self.halign = Gtk::Align::CENTER
            
#             self.pack_start(Gtk::Button.new.tap { |bouton|
#                 bouton.add(Gtk::Label.new.tap { |label|
#                     label.set_markup("<b>Tutoriel</b>")
#                     label.show
#                 })
#                 bouton.height_request = 64
#                 bouton.width_request = 400
#                 bouton.margin_bottom = 10
#                 bouton.signal_connect("clicked") { app.tutoriel }
#                 bouton.show
#             }, :expand => true, :fill => true, :padding => 0)

			

            lbl = Gtk::Label.new.tap{ |label|
                label.set_markup("Kurokabe")
                label.show 
            }


            self.pack_start(lbl)

            btnJouer = BoutonMenu.creer(Langue.text("jouer"), 10, 10, MenuNiveaux.method(:new), app)
            Langue.addListener(btnJouer, "jouer")
            btnJouer.show

            self.pack_start(btnJouer)

            # btnClassement = BoutonMenu.creer("CLASSEMENT", 10, 10, MenuClassement.method(:new), app)
            # #Langue.addListener(btnClassement, "classement")
            # btnJouer.show

            # self.pack_start(btnClassement)

            btnRegles = BoutonMenu.creer("REGLES", 10, 10, MenuRegles.method(:new), app)
            #Langue.addListener(btnRegles, "regles")
            btnRegles.show

            self.pack_start(btnRegles)
            
            #btnQuitter=Gtk::Button.new(:label =>"QUITTER")

            btnQuitter = BoutonSpecial.creer("QUITTER", 10, 10, app.method(:closeApp))
            #Langue.addListener(btnQuitter, "quitter")
            btnQuitter.show

            self.pack_start(btnQuitter)



        langueBox=Gtk::Box.new(:horizontal).tap { |boite|
            boite.pack_start(BoutonLangue.creer("/../../assets/img/fr_flag.png", 10, 10, 0).show)
            boite.pack_start(BoutonLangue.creer("/../../assets/img/en_flag.png", 10, 10, 1).show)
            boite.show
        }

        self.pack_start(langueBox)

        self.show
        
        @titlebar = Gtk::HeaderBar.new.tap { |barre|
            barre.title = "Nurikabe"
            barre.show_close_button = true
            barre.pack_start(BoutonRetour.new.tap { |bouton|
                bouton.sensitive = false
            })
            barre.show
        }
        
    end
    

end