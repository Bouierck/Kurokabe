require 'gtk3'
require 'fileutils'

require_relative '../Donnees/Sauvegarde.rb'

require_relative '../Boutons/BoutonRetour.rb'
require_relative '../Boutons/BoutonNiveau.rb'

require_relative '../GUI/NiveauGUI.rb'

require_relative '../Niveau/Niveau.rb'

    ##
    # Widget graphique représentant l'écran d'accueil.
    class MenuNiveaux < Gtk::Box
    

        
    attr_reader :titlebar, :mode
    

    def initialize(app)
        super(:vertical, 10)

        @@btnClassiqueActive = 1
        @@btnClasseActive = 0
        @@btnAventureActive = 0
        @@path = "../../profile/"

        @app = app
        @app.fenetre.resize(700,700)

        lbl = Gtk::Label.new.tap{ |label|
            label.set_markup("NIVEAUX")
            label.style_context.add_class("titre")
            label.style_context.add_class("margin-bot")
            label.show 
        }

        self.pack_start(lbl)

        @btnAventure= Gtk::Button.new
        @btnAventure.style_context.add_class("bouton")
        @btnAventure.style_context.add_class("margin2")

        @btnClasse= Gtk::Button.new
        @btnClasse.style_context.add_class("bouton")
        @btnClasse.style_context.add_class("margin2")

        @btnClassique= Gtk::Button.new
        @btnClassique.style_context.add_class("bouton")
        @btnClassique.style_context.add_class("margin2")

            self.valign = Gtk::Align::CENTER
            self.halign = Gtk::Align::CENTER




            @btnClassique.tap{|bouton| 
                bouton.add(Gtk::Label.new.tap{ |label|
                    label.set_markup(Langue.text("lvlClassique"))
                    label.show	})
                bouton.signal_connect("clicked") { 
                    updateButton(1)
                    affichageMode()
                }
            bouton.show		}


            @btnAventure.tap{|bouton| 
                bouton.add(Gtk::Label.new.tap{ |label|
                    label.set_markup(Langue.text("lvlAventure"))
                    label.show	})
                bouton.signal_connect("clicked") { 
                    updateButton(2)
                    affichageMode()
                }
                    
                   
            bouton.show		}
            


            @btnClasse.tap{|bouton| 
                bouton.add(Gtk::Label.new.tap{ |label|
                    label.set_markup(Langue.text("lvlClasse"))
                    label.show	})
                bouton.signal_connect("clicked") { 
                    updateButton(3)
                    affichageMode()
                }
                   
            bouton.show		}
            

            boiteMode = Gtk::Box.new(:horizontal).tap { |boite|
                boite.pack_start(@btnClassique)
                boite.pack_start(@btnAventure)
                boite.pack_start(@btnClasse)
                
                boite.show
            }

        self.pack_start(boiteMode)

        

        self.show
        @titlebar = Gtk::HeaderBar.new.tap { |barre|
            barre.title = "Nurikabe"
            barre.subtitle = "Grilles "
            barre.show_close_button = true
            barre.pack_start(BoutonRetour.creer(MenuPrincipal.method(:new), app))
            barre.show
        }

        @mode = 1 # 1 = Classique, 2 = Aventure, 3 = Classe

        @btnClassique.set_sensitive(false)

        @@ary = Array.new()


                
        # ----------------    #Label Header des boites main ------------------------

        facileLabel = Gtk::Label.new.tap{ |label|
            label.set_markup(Langue.text("difficulteFacile"))
            label.style_context.add_class("difficulte")
            label.show 
        }
        moyenLabel = Gtk::Label.new.tap{ |label|
            label.set_markup(Langue.text("difficulteMoyen"))
            label.style_context.add_class("difficulte")
            label.show 
        }
        difficileLabel = Gtk::Label.new.tap{ |label|
            label.set_markup(Langue.text("difficulteDifficile"))
            label.style_context.add_class("difficulte")
            label.show 
        }



        # ----------------    Boutons niveaux ------------------------

        niv11 = BoutonNiveau.creer("level 1", 10, 10, 1, self, @app)
        niv11.show

        niv12 = BoutonNiveau.creer("level 2", 10, 10, 2, self, @app)
        niv12.show

        niv13 = BoutonNiveau.creer("level 3", 10, 10, 3, self, @app)
        niv13.show

        niv14 = BoutonNiveau.creer("level 4", 10, 10, 4, self, @app)
        niv14.show

        niv15 = BoutonNiveau.creer("level 5", 10, 10, 5, self, @app)
        niv15.show

        niv21 = BoutonNiveau.creer("level 6", 10, 10, 6, self, @app)
        niv21.show

        niv22 = BoutonNiveau.creer("level 7", 10, 10, 7, self, @app)
        niv22.show

        niv23 = BoutonNiveau.creer("level 8", 10, 10, 8, self, @app)
        niv23.show

        niv24 = BoutonNiveau.creer("level 9", 10, 10, 9, self, @app)
        niv24.show

        niv25 = BoutonNiveau.creer("level 10", 10, 10, 10, self, @app)
        niv25.show

        niv31 = BoutonNiveau.creer("level 11", 10, 10, 11, self, @app)
        niv31.show

        niv32 = BoutonNiveau.creer("level 12", 10, 10, 12, self, @app)
        niv32.show

        niv33 = BoutonNiveau.creer("level 13", 10, 10, 13, self, @app)
        niv33.show

        niv34 = BoutonNiveau.creer("level 14", 10, 10, 14, self, @app)
        niv34.show

        niv35 = BoutonNiveau.creer("level 15", 10, 10, 15, self, @app)
        niv35.show

        niv11.style_context.add_class("niveau")
        niv12.style_context.add_class("niveau")
        niv13.style_context.add_class("niveau")
        niv14.style_context.add_class("niveau")
        niv15.style_context.add_class("niveau")
        niv21.style_context.add_class("niveau")
        niv22.style_context.add_class("niveau")
        niv23.style_context.add_class("niveau")
        niv24.style_context.add_class("niveau")
        niv25.style_context.add_class("niveau")
        niv31.style_context.add_class("niveau")
        niv32.style_context.add_class("niveau")
        niv33.style_context.add_class("niveau")
        niv34.style_context.add_class("niveau")
        niv35.style_context.add_class("niveau")



        # ----------------    Boite regroupant boutons  ------------------------

        facileBtnBox=Gtk::Box.new(:horizontal).tap { |boite|
        boite.pack_start(niv11)
        boite.pack_start(niv12)
        boite.pack_start(niv13)
        boite.pack_start(niv14)
        boite.pack_start(niv15)

        boite.show
        }
        moyenBtnBox=Gtk::Box.new(:horizontal).tap { |boite|
        boite.pack_start(niv21)
        boite.pack_start(niv22)
        boite.pack_start(niv23)
        boite.pack_start(niv24)
        boite.pack_start(niv25)
        boite.show
        }
        difficileBtnBox=Gtk::Box.new(:horizontal).tap { |boite|
        boite.pack_start(niv31)
        boite.pack_start(niv32)
        boite.pack_start(niv33)
        boite.pack_start(niv34)
        boite.pack_start(niv35)
        boite.show
        }

        # ----------------    Boite regroupant label + boite ------------------------

        facileBox=Gtk::Box.new(:vertical).tap { |boite|
        boite.pack_start(facileLabel)
        boite.pack_start(facileBtnBox)
        boite.show
        }
        moyenBox=Gtk::Box.new(:vertical).tap { |boite|
        boite.pack_start(moyenLabel)
        boite.pack_start(moyenBtnBox)
        boite.show
        }
        difficileBox=Gtk::Box.new(:vertical).tap { |boite|
        boite.pack_start(difficileLabel)
        boite.pack_start(difficileBtnBox)
        boite.show
        }

        
        @@ary.push(niv11)
        @@ary.push(niv12)
        @@ary.push(niv13)
        @@ary.push(niv14)
        @@ary.push(niv15)
        @@ary.push(niv21)
        @@ary.push(niv22)
        @@ary.push(niv23)
        @@ary.push(niv24)
        @@ary.push(niv25)
        @@ary.push(niv31)
        @@ary.push(niv32)
        @@ary.push(niv33)
        @@ary.push(niv34)
        @@ary.push(niv35)


        self.pack_start(facileBox)
        self.pack_start(moyenBox)
        self.pack_start(difficileBox)

        affichageMode()

    end
        
    def onEvt(label,message)
        puts message
        label.set_text(message)
    end
    
    def updateButton(nb)
        if nb == 1 then
            if @@btnClassiqueActive == 0 then
                @btnClassique.set_sensitive(false)
                @btnClasse.set_sensitive(true)
                @btnAventure.set_sensitive(true)
                @@btnClasseActive = 0
                @@btnAventureActive = 0
                @mode = 1

            end

        elsif nb == 2 then
            if @@btnAventureActive == 0 then
                @btnAventure.set_sensitive(false)
                @btnClassique.set_sensitive(true)
                @btnClasse.set_sensitive(true)
                @@btnClassiqueActive = 0
                @@btnClasseActive = 0
                @mode = 2

            end

        elsif nb == 3 then 
            if @@btnClasseActive == 0 then
                @@btnClassiqueActive = 0
                @@btnAventureActive = 0
                @btnClassique.set_sensitive(true)
                @btnAventure.set_sensitive(true)
                @btnClasse.set_sensitive(false)
                @mode = 3

            end
        end
    end

    def validate(btn,niv,file_data)
		if @mode == 1 then
#			p "1"
# 			btn.set_label(" "+file_data[niv-11]+" ")
			if file_data[niv-11] == "1"
				btn.set_label("  ✓  ")
			else
				btn.set_label("     ");
			end
		end
		if @mode == 2 then
#			p "2"
			if file_data[niv+4] == "1"
				btn.set_label("★☆☆")
			elsif file_data[niv+4] == "2"
				btn.set_label("★★☆");
			elsif file_data[niv+4] == "3"
				btn.set_label("★★★");
			else
				btn.set_label("☆☆☆");
			end
		end
		if @mode == 3 && file_data[niv+19]!= 0 then
#			p "3"
			m = 0
			s = 0
			strs = ""
			total = file_data[niv+19].to_i
			str = ""
			if file_data[niv+19].to_i > 60 then
				m = file_data[niv+19].to_i/60
				total = total - m*60
			end
			if file_data[niv+19].to_i > 0 then
				s = total
				if s<10 then
					str = m.to_s + ":" + "0" + s.to_s
				else
					str = m.to_s + ":" + s.to_s
				end
			end
			btn.set_label(str)
		end
	end

    def affichageMode()


		# Chargement fichier
		file = File.open(__dir__ + "/../../profile/" + @app.user.nom + "/infosScore.krkb")
		file_data = file.read.split(" ")
#		p file_data

		x = 11
		y = 0
		while x != 26
			validate(@@ary[y],x,file_data)
			x = x + 1
			y = y + 1
		end

	end

end