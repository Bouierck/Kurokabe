require 'gtk3'

require_relative '../Boutons/BoutonRetour.rb'

require_relative './MenuPrincipal.rb'
require_relative './ClassementNiveau.rb'



class MenuClassement < Gtk::Box

    attr_reader:titlebar
    

    def initialize(app)
        super(:vertical, 10)

        @app = app

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

        nivFacileBox=Gtk::Box.new(:horizontal).tap { |boite|
            boite.pack_start(niv11)
            boite.pack_start(niv12)
            boite.pack_start(niv13)
            boite.pack_start(niv14)
            boite.pack_start(niv15)
            boite.show
        }

        nivMediumBox=Gtk::Box.new(:horizontal).tap { |boite|
            boite.pack_start(niv21)
            boite.pack_start(niv22)
            boite.pack_start(niv23)
            boite.pack_start(niv24)
            boite.pack_start(niv25)
            boite.show
        }

        nivDifficileBox=Gtk::Box.new(:horizontal).tap { |boite|
            boite.pack_start(niv31)
            boite.pack_start(niv32)
            boite.pack_start(niv33)
            boite.pack_start(niv34)
            boite.pack_start(niv35)
            boite.show
        }


# -------------------- Creation des labels ---------------------------

        topLabel = Gtk::Label.new.tap{ |label|
            label.set_markup(Langue.text("classement"))
            label.show 
        }

        facileLabel = Gtk::Label.new.tap{ |label|
            label.set_markup(Langue.text("difficulteFacile"))
            label.show 
        }

        mediumLabel = Gtk::Label.new.tap{ |label|
            label.set_markup(Langue.text("difficulteMoyen"))
            label.show 
        }

        difficileLabel = Gtk::Label.new.tap{ |label|
            label.set_markup(Langue.text("difficulteDifficile"))
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
        
        @titlebar = Gtk::HeaderBar.new.tap { |barre|
            barre.title = "Nurikabe"
            barre.show_close_button = true
            barre.pack_start(BoutonRetour.creer(MenuPrincipal.method(:new), app).show)
            barre.show
        }

    end

    def open_with_datas(datas)
        #@app.classementniveau(datas)
    end


end