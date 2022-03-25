##
# Auteur Georget Labbe
# Version 0.1 : Date : Wed Dec 19 15:38:33 CET 2018
#
require 'gtk3'


class MenuNiveaux < Gtk::Window
    @@blank = "blank.png"
    @@bigblank = "bigblank.png"
	def initialize 
		super()
       
	    # Titre de la fenêtre
	    set_title("Kurokabe")
	    
	    # Quand la fenêtre est détruite il faut quitter
	    signal_connect('destroy') do
	      Gtk.main_quit
	    end

        @@mode = 1 # 1 = Classique, 2 = Aventure, 3 = Classe

        @@btnClassiqueActive = 1
        @@btnClasseActive = 0
        @@btnAventureActive = 0
        @@path = "../../profile/"
        @@ary = Array.new()

        def onEvt(label,message)
            puts message
            label.set_text(message)
        end

        def updateButton(btn,nb, otherBtn1, otherBtn2)
            if nb == 1 then
                if @@btnClassiqueActive == 0 then
                    btn.set_sensitive(false)
                    otherBtn1.set_sensitive(true)
                    otherBtn2.set_sensitive(true)
                    @@btnClasseActive = 0
                    @@btnAventureActive = 0
                    @@mode = 1
                else
                    @@btnClassiqueActive = 1
                    btn.set_sensitive(true)
                end

            elsif nb == 2 then
                if @@btnAventureActive == 0 then
                    btn.set_sensitive(false)
                    otherBtn1.set_sensitive(true)
                    otherBtn2.set_sensitive(true)
                    @@btnClassiqueActive = 0
                    @@btnClasseActive = 0
                    @@mode = 2

                else
                    #@@btnAventureActive = 1
                    btn.set_sensitive(true)
                end

            elsif nb == 3 then 
                if @@btnClasseActive == 0 then
                    @@btnClassiqueActive = 0
                    @@btnAventureActive = 0
                    otherBtn1.set_sensitive(true)
                    otherBtn2.set_sensitive(true)
                    btn.set_sensitive(false)
                    @@mode = 3
                else
                    #@@btnClasseActive = 1
                    btn.set_sensitive(true)
                end
            end
        end
	    
	    # Taille de la fenêtre
	    set_default_size(100,100)
	    # Réglage de la bordure
	    border_width=5
	    # On ne peut pas redimensionner
	    set_resizable(false)
	    # L'application est toujours centrée
	    set_window_position(Gtk::WindowPosition::CENTER_ALWAYS)


        # Création du Layout global
	    mainHBox=Gtk::Box.new(:horizontal,5)
	    mainHBox.set_homogeneous(false)
		add(mainHBox)

        image2 = load_image(@@blank)
        image1 = load_image(@@bigblank)
        mainHBox.add(image1)
	
	    # Création du Layout global
	    mainBox=Gtk::Box.new(:vertical,5)
	    mainBox.set_homogeneous(false)
		mainHBox.add(mainBox)

        
        image1 = load_image(@@bigblank)
        mainHBox.add(image1)

        image2 = load_image(@@blank)
        mainBox.add(image2)

	    # Création du Label 
	    niveauxLabel=Gtk::Label.new("NIVEAUX")
	    mainBox.add(niveauxLabel)


        

        image2 = load_image(@@blank)
        mainBox.add(image2)

        # Création du Layout de boutons
	    boutonsBox=Gtk::Box.new(:horizontal,5)
	    boutonsBox.set_homogeneous(true)
		mainBox.add(boutonsBox)
		
	    # Création des Boutons
		btnAventure=Gtk::Button.new(:label =>"AVENTURE")
        btnClasse=Gtk::Button.new(:label =>"CLASSÉ")
        btnClassique=Gtk::Button.new(:label =>"CLASSIQUE")

        btnClassique.set_sensitive(false)


		btnAventure.style_context.add_class("bouton")
		btnClasse.style_context.add_class("bouton")
		btnClassique.style_context.add_class("bouton")
		boutonsBox.style_context.add_class("margin-top")


        btnClassique.signal_connect("clicked") { 
            #onEvt(facileLabel,"Bite")
            updateButton(btnClassique, 1,btnAventure,btnClasse)
            affichageMode()
        }
        boutonsBox.add(btnClassique)


        btnAventure.signal_connect("clicked") { 
            #onEvt(facileLabel,"Bite")
            updateButton(btnAventure, 2,btnClasse,btnClassique)
            affichageMode()
        }
        boutonsBox.add(btnAventure)


        btnClasse.signal_connect("clicked") { 
            #onEvt(facileLabel,"Bite")
            updateButton(btnClasse, 3,btnAventure,btnClassique)
            affichageMode()
        }
        boutonsBox.add(btnClasse)



        image2 = load_image(@@blank)
        mainBox.add(image2)

        # Création du Layout des niveaux
	    @niveauxBox=Gtk::Box.new(:vertical,15)
	    @niveauxBox.set_homogeneous(true)
		mainBox.add(@niveauxBox)



	def validate(btn,niv,file_data)
		puts file_data[niv]
		if @@mode == 1 then
# 			p "1"
# 			btn.set_label(" "+file_data[niv-11]+" ")
			if file_data[niv-11] == "1"
				btn.set_label("  ✓  ")
			else
				btn.set_label("     ");
			end
		end
		if @@mode == 2 then
			p "2"
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
			p "3"
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


# ----------------------------------- FACILE ------------------------------------------------

	def affichageMode

	
        # Création du Layout de Facile
	    facileBox=Gtk::Box.new(:vertical,15)
	    facileBox.set_homogeneous(true)
		@niveauxBox.add(facileBox)

        # Création du Label.new
        facileLabel=Gtk::Label.new("FACILE")
        facileBox.add(facileLabel)


        # Création du Layout de boutons facile
	    facileBtnBox=Gtk::Box.new(:horizontal,15)
	    facileBtnBox.set_homogeneous(true)
		facileBox.add(facileBtnBox)

		# Création du Layout de Moyen
	    moyenBox=Gtk::Box.new(:vertical,15)
	    moyenBox.set_homogeneous(true)
		@niveauxBox.add(moyenBox)

        # Création du Label 
	    moyenLabel=Gtk::Label.new("MOYEN")
	    moyenBox.add(moyenLabel)

        # Création du Layout de boutons moyen
	    moyenBtnBox=Gtk::Box.new(:horizontal,15)
	    moyenBtnBox.set_homogeneous(true)
		moyenBox.add(moyenBtnBox)


        # Création du Layout de Difficile
	    difficileBox=Gtk::Box.new(:vertical,15)
	    difficileBox.set_homogeneous(true)
		@niveauxBox.add(difficileBox)

        # Création du Label 
	    difficileLabel=Gtk::Label.new("DIFFICILE")
	    difficileBox.add(difficileLabel)

        # Création du Layout de boutons difficile
	    difficileBtnBox=Gtk::Box.new(:horizontal,15)
	    difficileBtnBox.set_homogeneous(true)
		difficileBox.add(difficileBtnBox)



        # Création des Boutons Classique Facile
		niv11=Gtk::Button.new(:label =>" ")
		niv11.signal_connect("clicked") { jeu(11) }
		facileBtnBox.add(niv11)

        niv12=Gtk::Button.new(:label =>" ")
        niv12.signal_connect("clicked") { jeu(12) }
		facileBtnBox.add(niv12)

        niv13=Gtk::Button.new(:label =>" ")
        niv13.signal_connect("clicked") { jeu(13) }
		facileBtnBox.add(niv13)

        niv14=Gtk::Button.new(:label =>" ")
        niv14.signal_connect("clicked") { jeu(14) }
		facileBtnBox.add(niv14)

        niv15=Gtk::Button.new(:label =>" ")
        niv15.signal_connect("clicked") { jeu(15) }
		facileBtnBox.add(niv15)



        # Création des Boutons Classique Moyen
		niv21=Gtk::Button.new(:label =>" ")
		niv21.signal_connect("clicked") { jeu(21) }
		moyenBtnBox.add(niv21)

        niv22=Gtk::Button.new(:label =>" ")
        niv22.signal_connect("clicked") { jeu(22) }
		moyenBtnBox.add(niv22)

        niv23=Gtk::Button.new(:label =>" ")
        niv23.signal_connect("clicked") { jeu(23) }
		moyenBtnBox.add(niv23)

        niv24=Gtk::Button.new(:label =>" ")
        niv24.signal_connect("clicked") { jeu(24) }
		moyenBtnBox.add(niv24)

        niv25=Gtk::Button.new(:label =>" ")
        niv25.signal_connect("clicked") { jeu(25) }
		moyenBtnBox.add(niv25)



        # Création des Boutons Classique Difficile
		niv31=Gtk::Button.new(:label =>" ")
		niv31.signal_connect("clicked") { jeu(31) }
		difficileBtnBox.add(niv31)

        niv32=Gtk::Button.new(:label =>" ")
        niv32.signal_connect("clicked") { jeu(32) }
		difficileBtnBox.add(niv32)

        niv33=Gtk::Button.new(:label =>" ")
        niv33.signal_connect("clicked") { jeu(33) }
		difficileBtnBox.add(niv33)

        niv34=Gtk::Button.new(:label =>"✔")
        niv34.signal_connect("clicked") { jeu(34) }
		difficileBtnBox.add(niv34)

        niv35=Gtk::Button.new(:label =>"★★☆")
        niv35.signal_connect("clicked") { jeu(35)}
		difficileBtnBox.add(niv35)

		niv11.style_context.add_class("bouton")
		niv12.style_context.add_class("bouton")
		niv13.style_context.add_class("bouton")
		niv14.style_context.add_class("bouton")
		niv15.style_context.add_class("bouton")
		niv21.style_context.add_class("bouton")
		niv22.style_context.add_class("bouton")
		niv23.style_context.add_class("bouton")
		niv24.style_context.add_class("bouton")
		niv25.style_context.add_class("bouton")
		niv31.style_context.add_class("bouton")
		niv32.style_context.add_class("bouton")
		niv33.style_context.add_class("bouton")
		niv34.style_context.add_class("bouton")
		niv35.style_context.add_class("bouton")
		

		# Chargement fichier
		file = File.open("score.txt")
		file_data = file.read.split(" ")
		p file_data

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
		x = 11
		y = 0
		while x != 26
			p @@ary[y]
			p x
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

# ----------------------------------- END ------------------------------------------------

	affichageMode()
# 	def choiceLevel()
# 		if @@mode == 1
# 			classiqueMode()
# 		elsif @@mode == 2
# 			aventureMode()
# 		elsif @@mode == 3
# 			classeMode()
# 		end
# 	end



	def jeu(niv)
	
		if @@mode == 1 then
			launch = @@path + "/Classique/"
		elsif @@mode == 2 then
			launch = @@path + "/Aventure/"
		elsif @@mode == 3 then
			launch = @@path + "/Classe/"
		end

		launch += niv.to_s + ".game"
		p launch
	end


	#choiceLevel()
		
        image1 = load_image(@@bigblank)
        mainBox.add(image1)

        # Création du bouton Retour
		btnRetour=Gtk::Button.new(:label =>"RETOUR")
		
		btnRetour.signal_connect("clicked") { 
		            #onEvt(facileLabel,"Bite")
		            
		            p "load previous file"
		            Gtk.main_quit
		        }
		
		mainBox.add(btnRetour)

        image2 = load_image(@@blank)
        mainBox.add(image2)
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


Gtk.init if Gtk.respond_to?(:init)
        provider = Gtk::CssProvider.new
        screen = Gdk::Display.default.default_screen
        Gtk::StyleContext.add_provider_for_screen(screen, provider, 20000)
        provider.load(path: "Style.css")
    app = MenuNiveaux.new
    app.show_all
Gtk.main
end