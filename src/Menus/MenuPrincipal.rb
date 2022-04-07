require 'gtk3'

require_relative '../Boutons/BoutonMenu.rb'
require_relative '../Boutons/BoutonDidacticiel.rb'
require_relative '../Boutons/BoutonLangue.rb'

require_relative './MenuClassement.rb'

require_relative '../Donnees/Langue.rb'

require_relative './Menu.rb'

    ##
    # Widget graphique représentant l'écran d'accueil.
    class MenuPrincipal < Menu
        
        attr_reader :titlebar, :mode

        public_class_method :new
        
        ##
        # Méthode permettant de créer l'écran d'accueil.
        #
        # Paramètres :
        # [+app+]   Application (Kurokabe)
        def initialize(app)
            super(:vertical, 10)

            app.fenetre.resize(700,700)
            
            @mode = 1 # pour le didacticiel

            self.valign = Gtk::Align::CENTER
            self.halign = Gtk::Align::CENTER		
            
            self.style_context.add_class("margin-left")
            self.style_context.add_class("margin-right")

            lbl = Gtk::Label.new.tap{ |label|
                label.set_markup("KUROKABE")
                label.style_context.add_class("titre")
                label.style_context.add_class("margin-bot")
                label.show 
            }

            self.pack_start(lbl)



            btnJouer = BoutonMenu.creer(Langue.text("jouer"), MenuNiveaux.method(:new), app)
            Langue.addListener(btnJouer, "jouer")
            btnJouer.style_context.add_class("bouton")
            btnJouer.show

            self.pack_start(btnJouer)



            btnClassement = BoutonMenu.creer(Langue.text("classement"), MenuClassement.method(:new), app)
            Langue.addListener(btnClassement, "classement")
            btnClassement.style_context.add_class("bouton")
            btnClassement.show

            self.pack_start(btnClassement)


                      
            btnRegles = BoutonMenu.creer(Langue.text("menuRegles"), MenuRegles.method(:new), app)
            Langue.addListener(btnRegles, "menuRegles")
            btnRegles.style_context.add_class("bouton")
            btnRegles.show

            self.pack_start(btnRegles)


            
            btnTuto = BoutonDidacticiel.creer(Langue.text("didacticiel"), app)
            Langue.addListener(btnTuto, "didacticiel")
            btnTuto.style_context.add_class("bouton")
            btnTuto.style_context.add_class("margin-bot3")
            btnTuto.show

            self.pack_start(btnTuto)



            btnQuitter = BoutonSpecial.creer(Langue.text("quitter"), app.method(:closeApp))
            Langue.addListener(btnQuitter, "quitter")
            btnQuitter.style_context.add_class("bouton")
            btnQuitter.style_context.add_class("margin-bot")
            
            btnQuitter.show

            self.pack_start(btnQuitter)




            francais = BoutonLangue.creer("", 0)
            francais.style_context.add_class("btn-langue-fr")
            
            anglais = BoutonLangue.creer("", 1)
            anglais.style_context.add_class("btn-langue-en")
    
            langueBox=Gtk::Box.new(:horizontal).tap { |boite|
                boite.pack_start(francais.show)
                boite.pack_start(anglais.show)
                boite.show
            }

            langueBox.style_context.add_class("margin-top")

        self.pack_start(langueBox)



        self.show


        #Bouton retour de la barre de la fenêtre
        @titlebar = Gtk::HeaderBar.new.tap { |barre|
            barre.title = "Kurokabe"
            barre.show_close_button = true
            barre.show
        }
        
    end
    

end