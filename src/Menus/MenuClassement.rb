require 'gtk3'

require_relative '../Boutons/BoutonRetour.rb'

require_relative './MenuPrincipal.rb'
require_relative './ClassementNiveau.rb'



class MenuClassement < Gtk::Box

    attr_reader:titlebar
    

    def initialize(app)
        super(:vertical, 10)

        @app = app
        @app.fenetre.resize(700,700)

        self.valign = Gtk::Align::CENTER
        self.halign = Gtk::Align::CENTER

# -------------------Load buttons Facile --------------------------------

        niv11 = Gtk::Button.new.tap{ |button|
            button.add(Gtk::Label.new.tap{|label|
                label.set_markup("1.1")
                label.show
            })
            button.signal_connect("clicked") { 
            open_with_datas(11)
        }
        button.show
    }
        
        niv12 = Gtk::Button.new.tap{ |button|
            button.add(Gtk::Label.new.tap{|label|
                label.set_markup("1.2")
                label.show	})
                button.signal_connect("clicked") { 
            open_with_datas(12)
        }
        button.show
    }

        niv13 = Gtk::Button.new.tap{ |button|
            button.add(Gtk::Label.new.tap{|label|
                label.set_markup("1.3")
                label.show	})
                button.signal_connect("clicked") { 
            open_with_datas(13)
        }
        button.show
    }

        niv14 = Gtk::Button.new.tap{ |button|
            button.add(Gtk::Label.new.tap{|label|
                label.set_markup("1.4")
                label.show	})
                button.signal_connect("clicked") { 
            open_with_datas(14)
        }
        button.show
    }

        niv15 = Gtk::Button.new.tap{ |button|
            button.add(Gtk::Label.new.tap{|label|
                label.set_markup("1.5")
                label.show	})
                button.signal_connect("clicked") { 
            open_with_datas(15)
        }
        button.show
    }

# -------------------Load buttons Medium --------------------------------

        niv21 = Gtk::Button.new.tap{ |button|
        button.add(Gtk::Label.new.tap{|label|
            label.set_markup("2.1")
            label.show	})
            button.signal_connect("clicked") { 
            open_with_datas(21)
        }
        button.show
    }
        
        niv22 = Gtk::Button.new.tap{ |button|
        button.add(Gtk::Label.new.tap{|label|
            label.set_markup("2.2")
            label.show	})
            button.signal_connect("clicked") { 
            open_with_datas(22)
        }
        button.show
    }

        niv23 = Gtk::Button.new.tap{ |button|
        button.add(Gtk::Label.new.tap{|label|
            label.set_markup("2.3")
            label.show	})
            button.signal_connect("clicked") { 
            open_with_datas(23)
        }
        button.show
    }

        niv24 = Gtk::Button.new.tap{ |button|
        button.add(Gtk::Label.new.tap{|label|
            label.set_markup("2.4")
            label.show	})
            button.signal_connect("clicked") { 
            open_with_datas(24)
        }
        button.show
    }

        niv25 = Gtk::Button.new.tap{ |button|
        button.add(Gtk::Label.new.tap{|label|
            label.set_markup("2.5")
            label.show	})
            button.signal_connect("clicked") { 
            open_with_datas(25)
        }
        button.show
    }
        

# -------------------Load buttons Difficile --------------------------------

        niv31 = Gtk::Button.new.tap{ |button|
        button.add(Gtk::Label.new.tap{|label|
            label.set_markup("3.1")
            label.show	})
            button.signal_connect("clicked") { 
            open_with_datas(31)
        }
        button.show
    }

        niv32 = Gtk::Button.new.tap{ |button|
        button.add(Gtk::Label.new.tap{|label|
           label.set_markup("3.2")
            label.show	})
            button.signal_connect("clicked") { 
            open_with_datas(32)
        }
        button.show
    }

        niv33 = Gtk::Button.new.tap{ |button|
        button.add(Gtk::Label.new.tap{|label|
          label.set_markup("3.3")
          label.show	})
          button.signal_connect("clicked") { 
         open_with_datas(33)
        }
        button.show
    }

        niv34 = Gtk::Button.new.tap{ |button|
        button.add(Gtk::Label.new.tap{|label|
           label.set_markup("3.4")
           label.show	})
           button.signal_connect("clicked") { 
           open_with_datas(34)
        }
        button.show
    }

        niv35 = Gtk::Button.new.tap{ |button|
        button.add(Gtk::Label.new.tap{|label|
         label.set_markup("3.5")
            label.show	})
        button.signal_connect("clicked") { 
            open_with_datas(35)
        }
        button.show
    }
        



# ------------ Creation des boites -----------------------

        niv11.style_context.add_class("bouton")
        niv11.width_request = 79
        niv11.height_request = 55

        niv12.style_context.add_class("bouton")
        niv12.width_request = 79
        niv12.height_request = 55

        niv13.style_context.add_class("bouton")
        niv13.width_request = 79
        niv13.height_request = 55

        niv14.style_context.add_class("bouton")
        niv14.width_request = 79
        niv14.height_request = 55

        niv15.style_context.add_class("bouton")
        niv15.width_request = 79
        niv15.height_request = 55
        
        niv21.style_context.add_class("bouton")
        niv21.width_request = 79
        niv21.height_request = 55

        niv22.style_context.add_class("bouton")
        niv22.width_request = 79
        niv22.height_request = 55

        niv23.style_context.add_class("bouton")
        niv23.width_request = 79
        niv23.height_request = 55

        niv24.style_context.add_class("bouton")
        niv24.width_request = 79
        niv24.height_request = 55

        niv25.style_context.add_class("bouton")
        niv25.width_request = 79
        niv25.height_request = 55

        
        niv31.style_context.add_class("bouton")
        niv31.width_request = 79
        niv31.height_request = 55

        niv32.style_context.add_class("bouton")
        niv32.width_request = 79
        niv32.height_request = 55

        niv33.style_context.add_class("bouton")
        niv33.width_request = 79
        niv33.height_request = 55

        niv34.style_context.add_class("bouton")
        niv34.width_request = 79
        niv34.height_request = 55

        niv35.style_context.add_class("bouton")
        niv35.width_request = 79
        niv35.height_request = 55

        #Affiche les niveaux faciles en ligne
        nivFacileBox=Gtk::Box.new(:horizontal).tap { |boite|
            boite.pack_start(niv11)
            boite.pack_start(niv12)
            boite.pack_start(niv13)
            boite.pack_start(niv14)
            boite.pack_start(niv15)
            boite.show
        }

        #Affiche les niveaux moyens en ligne
        nivMediumBox=Gtk::Box.new(:horizontal).tap { |boite|
            boite.pack_start(niv21)
            boite.pack_start(niv22)
            boite.pack_start(niv23)
            boite.pack_start(niv24)
            boite.pack_start(niv25)
            boite.show
        }

        #Affiche les niveaux difficiles en ligne
        nivDifficileBox=Gtk::Box.new(:horizontal).tap { |boite|
            boite.pack_start(niv31)
            boite.pack_start(niv32)
            boite.pack_start(niv33)
            boite.pack_start(niv34)
            boite.pack_start(niv35)
            boite.show
        }


# -------------------- Creation des labels ---------------------------

        #Titre de la fenêtre
        topLabel = Gtk::Label.new.tap{ |label|
            label.set_markup(Langue.text("classement"))
            label.style_context.add_class("titre")
            label.style_context.add_class("margin-bot")
            label.show 
        }


        #Labels des difficultés 

        facileLabel = Gtk::Label.new.tap{ |label|
            label.set_markup(Langue.text("difficulteFacile"))
            label.style_context.add_class("difficulte")
            label.show 
        }

        mediumLabel = Gtk::Label.new.tap{ |label|
            label.set_markup(Langue.text("difficulteMoyen"))
            label.style_context.add_class("difficulte")
            label.show 
        }

        difficileLabel = Gtk::Label.new.tap{ |label|
            label.set_markup(Langue.text("difficulteDifficile"))
            label.style_context.add_class("difficulte")
            label.show 
        }

# ---------------------------------------------------------------

		self.pack_start(topLabel)
		self.pack_start(facileLabel)
		self.pack_start(nivFacileBox)
		self.pack_start(mediumLabel)
		self.pack_start(nivMediumBox)
		self.pack_start(difficileLabel)
		self.pack_start(nivDifficileBox)

        self.show
        
        #Bouton retour dans la barre de la fenêtre
        @titlebar = Gtk::HeaderBar.new.tap { |barre|
            barre.title = "Kurokabe"
            barre.show_close_button = true
            barre.pack_start(BoutonRetour.creer(MenuPrincipal.method(:new), app).show)
            barre.show
        }

    end

    def open_with_datas(datas)
        mc = ClassementNiveau.new(@app, datas)
        @app.fenetre.remove(@app.fenetre.child) if(@app.fenetre.child)
        @app.fenetre.child = mc
        @app.fenetre.titlebar = mc.titlebar
        return @app.fenetre
    end


end