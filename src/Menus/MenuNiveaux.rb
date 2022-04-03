require 'gtk3'
require 'fileutils'

require_relative '../Donnees/Sauvegarde.rb'

require_relative '../Boutons/BoutonRetour.rb'

require_relative '../GUI/NiveauGUI.rb'

require_relative '../Niveau/Niveau.rb'

    ##
    # Widget graphique représentant l'écran d'accueil.
    class MenuNiveaux < Gtk::Box
    

        
    attr_reader :titlebar
    

    def initialize(app)
        super(:vertical, 10)

        @@btnClassiqueActive = 1
        @@btnClasseActive = 0
        @@btnAventureActive = 0
        @@path = "../../profile/"

        @app = app

        @btnAventure= Gtk::Button.new
        @btnClasse= Gtk::Button.new
        @btnClassique= Gtk::Button.new
            self.valign = Gtk::Align::CENTER
            self.halign = Gtk::Align::CENTER




            @btnClassique.tap{|bouton| 
                bouton.add(Gtk::Label.new.tap{ |label|
                    label.set_markup("CLASSIQUE")
                    label.show	})
                bouton.signal_connect("clicked") { 
                    updateButton(1)
                    affichageMode()
                }
            bouton.show		}


            @btnAventure.tap{|bouton| 
                bouton.add(Gtk::Label.new.tap{ |label|
                    label.set_markup("AVENTURE")
                    label.show	})
                bouton.signal_connect("clicked") { 
                    updateButton(2)
                    affichageMode()
                }
                    
                   
            bouton.show		}

            


            @btnClasse.tap{|bouton| 
                bouton.add(Gtk::Label.new.tap{ |label|
                    label.set_markup("CLASSÉ")
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
            barre.pack_start(BoutonRetour.new.tap { |bouton|
                bouton.signal_connect("clicked") { app.accueil }
            })
            barre.show
        }

        @@mode = 1 # 1 = Classique, 2 = Aventure, 3 = Classe

        @btnClassique.set_sensitive(false)

        @@ary = Array.new()


                
        # ----------------    #Label Header des boites main ------------------------

        facileLabel = Gtk::Label.new.tap{ |label|
            label.set_markup("FACILE")
            label.show 
        }
        moyenLabel = Gtk::Label.new.tap{ |label|
            label.set_markup("MOYEN")
            label.show 
        }
        difficileLabel = Gtk::Label.new.tap{ |label|
            label.set_markup("DIFFICILE")
            label.show 
        }



        # ----------------    Boutons niveaux ------------------------

        niv11 = Gtk::Button.new.tap{|bouton| 
        bouton.set_label("Jouer")
        bouton.signal_connect("clicked") { jeu(1) }
        bouton.show		}

        niv12 = Gtk::Button.new.tap{|bouton| 
        bouton.set_label("Jouer")
        bouton.signal_connect("clicked") { jeu(2) }
        bouton.show		}

        niv13 = Gtk::Button.new.tap{|bouton| 
        bouton.set_label("Jouer")
        bouton.signal_connect("clicked") { jeu(3) }
        bouton.show		}

        niv14 = Gtk::Button.new.tap{|bouton| 
        bouton.set_label("Jouer")
        bouton.signal_connect("clicked") { jeu(4) }
        bouton.show		}

        niv15 = Gtk::Button.new.tap{|bouton| 
        bouton.set_label("Jouer")
        bouton.signal_connect("clicked") { jeu(5) }
        bouton.show		}

        niv21 = Gtk::Button.new.tap{|bouton| 
        bouton.set_label("Jouer")
        bouton.signal_connect("clicked") { jeu(6) }
        bouton.show		}

        niv22 = Gtk::Button.new.tap{|bouton| 
        bouton.set_label("Jouer")
        bouton.signal_connect("clicked") { jeu(7) }
        bouton.show		}

        niv23 = Gtk::Button.new.tap{|bouton| 
        bouton.set_label("Jouer")
        bouton.signal_connect("clicked") { jeu(8) }
        bouton.show		}

        niv24 = Gtk::Button.new.tap{|bouton| 
        bouton.set_label("Jouer")
        bouton.signal_connect("clicked") { jeu(9) }
        bouton.show		}

        niv25 = Gtk::Button.new.tap{|bouton| 
        bouton.set_label("Jouer")
        bouton.signal_connect("clicked") { jeu(10) }
        bouton.show		}

        niv31 = Gtk::Button.new.tap{|bouton| 
        bouton.set_label("Jouer")
        bouton.signal_connect("clicked") { jeu(11) }
        bouton.show		}

        niv32 = Gtk::Button.new.tap{|bouton| 
        bouton.set_label("Jouer")
        bouton.signal_connect("clicked") { jeu(12) }
        bouton.show		}

        niv33 = Gtk::Button.new.tap{|bouton| 
        bouton.set_label("Jouer")
        bouton.signal_connect("clicked") { jeu(13) }
        bouton.show		}

        niv34 = Gtk::Button.new.tap{|bouton| 
        bouton.set_label("Jouer")
        bouton.signal_connect("clicked") { jeu(14) }
        bouton.show		}

        niv35 = Gtk::Button.new.tap{|bouton| 
        bouton.set_label("Jouer")
        bouton.signal_connect("clicked") { jeu(15) }
        bouton.show		}



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
                @@mode = 1

            end

        elsif nb == 2 then
            if @@btnAventureActive == 0 then
                @btnAventure.set_sensitive(false)
                @btnClassique.set_sensitive(true)
                @btnClasse.set_sensitive(true)
                @@btnClassiqueActive = 0
                @@btnClasseActive = 0
                @@mode = 2

            end

        elsif nb == 3 then 
            if @@btnClasseActive == 0 then
                @@btnClassiqueActive = 0
                @@btnAventureActive = 0
                @btnClassique.set_sensitive(true)
                @btnAventure.set_sensitive(true)
                @btnClasse.set_sensitive(false)
                @@mode = 3

            end
        end
    end

    def validate(btn,niv,file_data)
		if @@mode == 1 then
#			p "1"
# 			btn.set_label(" "+file_data[niv-11]+" ")
			if file_data[niv-11] == "1"
				btn.set_label("  ✓  ")
			else
				btn.set_label("     ");
			end
		end
		if @@mode == 2 then
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
		if @@mode == 3 && file_data[niv+19]!= 0 then
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
# 			if x == 16 then
# 				x = 21
# 			elsif x == 26 then
# 				x = 31
# 			end
		end

	end

    def jeu(niv)
	
		if @@mode == 1 then
			mode = "Classique"
		elsif @@mode == 2 then
			mode = "Aventure"
		elsif @@mode == 3 then
			mode = "Classe"
		end

        fichierName = __dir__ + "/../../profile/" + @app.user.nom + "/levels/" + mode + "/level" + niv.to_s + ".krkb"

        if(File.exist?(fichierName))
            fichier = File.open(fichierName, "r")
            niveau = Marshal.load(fichier)
            fichier.close
        else
            niveau = Niveau.creer(niv.to_s, @app.user, mode)
        end

        @app.lanceNiveau( NiveauGUI.creer(@app, niveau))

	end

    def load_image(img)
        begin
            # deprecated -> image = Gtk::Image.new "redrock.png"
            image = Gtk::Image.new(:file => img)

        rescue
            puts "cannot load image"
            exit
        end
    end


end