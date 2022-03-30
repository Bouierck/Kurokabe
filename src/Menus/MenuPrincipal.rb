require 'gtk3'
require_relative '../Boutons/BoutonRetour.rb'

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

            #btnJouer=Gtk::Button.new.tap(:label =>"JOUER")

            btnJouer = Gtk::Button.new.tap{|bouton| 
                bouton.add(Gtk::Label.new.tap{ |label|
                    label.set_markup("JOUER")
                    label.show	})
                bouton.signal_connect("clicked") { app.menus }
            bouton.show		}

            self.pack_start(btnJouer)


            #btnClassement=Gtk::Button.new(:label =>"CLASSEMENT")

            btnClassement = Gtk::Button.new.tap{|bouton| 
                bouton.add(Gtk::Label.new.tap{ |label|
                    label.set_markup("CLASSEMENT")
                    label.show	})
                bouton.signal_connect("clicked") { p 'bite' }
            bouton.show		}

            self.pack_start(btnClassement)


            #btnRegles=Gtk::Button.new(:label =>"REGLES")

            btnRegles = Gtk::Button.new.tap{|bouton| 
                bouton.add(Gtk::Label.new.tap{ |label|
                    label.set_markup("REGLES")
                    label.show	})
                bouton.signal_connect("clicked") { app.regles }
            bouton.show		}

            self.pack_start(btnRegles)
            
            #btnQuitter=Gtk::Button.new(:label =>"QUITTER")

            btnQuitter = Gtk::Button.new.tap{|bouton| 
                bouton.add(Gtk::Label.new.tap{ |label|
                    label.set_markup("QUITTER")
                    label.show	})
                bouton.signal_connect("clicked") { app.closeApp }
            bouton.show		}

            self.pack_start(btnQuitter)



        langueBox=Gtk::Box.new(:horizontal).tap { |boite|
            boite.pack_start(Gtk::Button.new.tap { |bouton|

                bouton.set_image(Gtk::Image.new("francais.png"))
                bouton.show
            })
            boite.pack_start(Gtk::Button.new.tap { |bouton|

                bouton.set_image(Gtk::Image.new("anglais.png"))
                bouton.show
            })
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