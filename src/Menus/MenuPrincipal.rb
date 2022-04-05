require 'gtk3'

require_relative '../Boutons/BoutonMenu.rb'
require_relative '../Boutons/BoutonLangue.rb'

require_relative './MenuClassement.rb'

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
            
            self.style_context.add_class("margin-left")
            self.style_context.add_class("margin-right")

            lbl = Gtk::Label.new.tap{ |label|
                label.set_markup("KUROKABE")
                label.style_context.add_class("titre")
                label.style_context.add_class("margin-bot")
                label.style_context.add_class("margin-bigtop")
                label.show 
            }


            self.pack_start(lbl)

            btnJouer = BoutonMenu.creer(Langue.text("jouer"), 10, 10, MenuNiveaux.method(:new), app)
            Langue.addListener(btnJouer, "jouer")
            btnJouer.style_context.add_class("bouton")
            btnJouer.show

            self.pack_start(btnJouer)

            btnClassement = BoutonMenu.creer(Langue.text("classement"), 10, 10, MenuClassement.method(:new), app)
            Langue.addListener(btnClassement, "classement")
            btnClassement.style_context.add_class("bouton")
            btnClassement.show

            # self.pack_start(btnClassement)

            self.pack_start(btnClassement)
                      
                      
            btnRegles = BoutonMenu.creer(Langue.text("menuRegles"), 10, 10, MenuRegles.method(:new), app)
            Langue.addListener(btnRegles, "menuRegles")
            btnRegles.style_context.add_class("bouton")
            btnRegles.show

            self.pack_start(btnRegles)
            
            #FAIRE LE BOUTON DIDACTICIEL
            btnRegles = BoutonMenu.creer(Langue.text("didacticiel"), 10, 10, MenuRegles.method(:new), app)
            Langue.addListener(btnRegles, "didacticiel")
            btnRegles.style_context.add_class("bouton")
            btnRegles.show

            self.pack_start(btnRegles)
            
            #btnQuitter=Gtk::Button.new(:label =>"QUITTER")

            btnQuitter = BoutonSpecial.creer(Langue.text("quitter"), 10, 10, app.method(:closeApp))
            Langue.addListener(btnQuitter, "quitter")
            btnQuitter.style_context.add_class("bouton")
            btnQuitter.style_context.add_class("margin-top")
            btnQuitter.style_context.add_class("margin-bot")
            
            btnQuitter.show

            self.pack_start(btnQuitter)



            francais = BoutonLangue.creer("", 10, 10, 0)
            francais.set_image(Gtk::Image.new(__dir__+"/../../assets/img/fr_flag.png"))
            francais.style_context.add_class("btn-langue-fr")
            
            anglais = BoutonLangue.creer("", 10, 10, 1)
            anglais.set_image(Gtk::Image.new(__dir__+"/../../assets/img/en_flag.png"))
            anglais.style_context.add_class("btn-langue-en")
    
    
            langueBox=Gtk::Box.new(:horizontal).tap { |boite|
                boite.pack_start(francais.show)
                boite.pack_start(anglais.show)
                boite.style_context.add_class("margin-bigbot")
                boite.show
            }

        self.pack_start(langueBox)

        self.show
        
        @titlebar = Gtk::HeaderBar.new.tap { |barre|
            barre.title = "Nurikabe"
            barre.show_close_button = true
            barre.show
        }
        
    end
    

end