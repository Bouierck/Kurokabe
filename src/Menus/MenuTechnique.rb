require 'gtk3'
require_relative '../Boutons/BoutonRetour.rb'

##
# Widget graphique représentant l'écran d'accueil.
class MenuTechnique < Gtk::Box

    attr_reader :titlebar
    def initialize(app)
        super(:vertical, 10)

		app.fenetre.resize(1250,50)

        @page = 1
        @text1 = Gtk::Label.new("")
        @text2 = Gtk::Label.new("")

		#On va déjà récupérer des images dans les dossiers pour initialiser les variables images
        @image11 = Gtk::Image.new(__dir__ + '/../../assets/img/Tech/01.png')
        @image12 = Gtk::Image.new(__dir__ + '/../../assets/img/Tech/02.png')
        @image21 = Gtk::Image.new(__dir__ + '/../../assets/img/Tech/11.png')
        @image22 = Gtk::Image.new(__dir__ + '/../../assets/img/Tech/12.png')

        labelPage = Gtk::Label.new("PAGE")
		labelPage.style_context.add_class("titre2")

	    @boutonRetour = Gtk::Button.new("❮")
	    @boutonAvance = Gtk::Button.new("❯")

		@boutonRetour.style_context.add_class("bouton")
		@boutonRetour.style_context.add_class("btn-left")

	    @boutonAvance.style_context.add_class("bouton")
	    @boutonAvance.style_context.add_class("btn-right")


		
        labelPage.tap{ |label|
            label.set_markup("PAGE")
        label.show 
        }




		#Change le contenu de la fenêtre en changeant la page

		#Page précédente
        @boutonRetour.tap{|bouton| 
                bouton.signal_connect("clicked") { 
                    @page - 1
					app.fenetre.resize(1250,50)
                    updateLabelPage(labelPage)
                }
            bouton.show		}

		#Page suivante
        @boutonAvance.tap{|bouton| 
            bouton.signal_connect("clicked") { 
                @page - 1
				app.fenetre.resize(1250,50)
                updateLabelPage(labelPage)
            }
        bouton.show		}


		#Création du navigateur entre les pages
        topbox=Gtk::Box.new(:horizontal).tap { |boite|
            boite.pack_start(@boutonRetour)
            boite.pack_start(labelPage)
            boite.pack_start(@boutonAvance)
            
            boite.show
        }
		topbox.set_homogeneous(true)
		topbox.style_context.add_class("margin-top")
		topbox.style_context.add_class("margin-bot")

        @image11.tap { |img| img.show }
        @image12.tap { |img| img.show }

        @image21.tap { |img| img.show }
        @image22.tap { |img| img.show }

        self.pack_start(topbox)


        
        @text1.tap{ |label|
            label.set_markup("les techs
                    ")
        label.show 
        }
        @text2.tap{ |label|
            label.set_markup("les techs
                    ")
        label.show 
        }


        imgBox1=Gtk::Box.new(:horizontal).tap { |boite|
            boite.pack_start(@image11)
            boite.pack_start(@image12)
            boite.show
        }
		imgBox1.style_context.add_class("margin-bot3")
		imgBox1.style_context.add_class("margin-top3")


        imgBox2=Gtk::Box.new(:horizontal).tap { |boite|
            boite.pack_start(@image21)
            boite.pack_start(@image22)
            
            boite.show
        }
		imgBox2.style_context.add_class("margin-bot3")
		imgBox2.style_context.add_class("margin-top3")


        midbox=Gtk::Box.new(:vertical).tap { |boite|
            boite.pack_start(@text1)

			imgBox1.halign = Gtk::Align::CENTER
            boite.pack_start(imgBox1)

            boite.pack_start(@text2)

			imgBox2.halign = Gtk::Align::CENTER
            boite.pack_start(imgBox2)
            boite.show
        }


		midbox.valign = Gtk::Align::CENTER
        midbox.halign = Gtk::Align::CENTER
		midbox.style_context.add_class("margin-bot")

        self.pack_start(midbox)

		#Met à jour le contenu de la page
        @boutonRetour.signal_connect("clicked") { 
			updateBack()
			updateSensitive()
			updatePage()
			updateLabelPage(labelPage)
			
        }
        @boutonAvance.signal_connect("clicked") { 
        	updateFront()
        	updateSensitive()
        	updatePage()
			updateLabelPage(labelPage)
			
        }    

# ------------------------------------------TEXT TECHNIQUES-----------------------------------------------------------------------

#	TECH 0
@textIle0 = Langue.text("tech0")

# 	#TECH 1
@textIle1 = Langue.text("tech1")

#TECH 2
@textIle2 = Langue.text("tech2")

#TECH 3
@textIle3 = Langue.text("tech3")

#TECH 4
@textIle4 = Langue.text("tech4")

#TECH 5
@textIle5 = Langue.text("tech5")

#TECH 6
@textIle6 = Langue.text("tech6")

#TECH 7
@textIle7 = Langue.text("tech7")

#TECH 8
@textIle8 = Langue.text("tech8")

#TECH 9
@textIle9 = Langue.text("tech9")

#TECH 10
@textIle10 = Langue.text("tech10")

#TECH 11
@textIle11 = Langue.text("tech11")

#TECH 12
@textIle12 = Langue.text("tech12")

#TECH 13
@textIle13 = Langue.text("tech13")



# ------------------------------------------FIN TEXT TECHNIQUES-----------------------------------------------------------------------


@image11.clear()
@image21.clear()
@image21.clear()
@image22.clear()

        updateLabelPage(labelPage)
	    updateSensitive()
	    updatePage()

        self.show

		#Bouton retour de la barre de la fenêtre
        @titlebar = Gtk::HeaderBar.new.tap { |barre|
                barre.title = "Kurokabe"
                barre.show_close_button = true
                barre.pack_start(BoutonRetour.creer(MenuRegles.method(:new), app).tap { |bouton| 
					bouton.sensitive = true
					bouton.show
				})
                barre.show
            }

    end


# ---------------------------------------------------------------------------------------------------------


    def updatePage()
		if(@page == 1) then
			@text1.set_label(@textIle0)

			#Change les images
			@image11.set_from_file(__dir__ + '/../../assets/img/Tech/01.png')
			@image12.set_from_file(__dir__ + '/../../assets/img/Tech/02.png')

			@text2.set_label(@textIle1)

			#Change les images
			@image21.set_from_file(__dir__ + '/../../assets/img/Tech/11.png')
			@image22.set_from_file(__dir__ + '/../../assets/img/Tech/12.png')

		elsif(@page == 2) then 
			@text1.set_label(@textIle2)

			#Change les images
			@image11.set_from_file(__dir__ + '/../../assets/img/Tech/21.png')
			@image12.set_from_file(__dir__ + '/../../assets/img/Tech/22.png')

			@text2.set_label(@textIle3)

			#Change les images
			@image21.set_from_file(__dir__ + '/../../assets/img/Tech/31.png')
			@image22.set_from_file(__dir__ + '/../../assets/img/Tech/32.png')

		elsif(@page == 3) then 
			@text1.set_label(@textIle4)

			#Change les images
			@image11.set_from_file(__dir__ + '/../../assets/img/Tech/41.png')
			@image12.set_from_file(__dir__ + '/../../assets/img/Tech/42.png')

			@text2.set_label(@textIle5)

			#Change les images
			@image21.set_from_file(__dir__ + '/../../assets/img/Tech/52.png')
			@image22.set_from_file(__dir__ + '/../../assets/img/Tech/52.png')

		elsif(@page == 4) then 
			@text1.set_label(@textIle6)

			#Change les images
			@image11.set_from_file(__dir__ + '/../../assets/img/Tech/61.png')
			@image12.set_from_file(__dir__ + '/../../assets/img/Tech/62.png')

			@text2.set_label(@textIle7)

			#Change les images
			@image21.set_from_file(__dir__ + '/../../assets/img/Tech/72.png')
			@image22.set_from_file(__dir__ + '/../../assets/img/Tech/72.png')

		elsif(@page == 5) then 
			@text1.set_label(@textIle8)

			#Change les images
			@image11.set_from_file(__dir__ + '/../../assets/img/Tech/81.png')
			@image12.set_from_file(__dir__ + '/../../assets/img/Tech/82.png')

			@text2.set_label(@textIle9)

			#Change les images
			@image21.set_from_file(__dir__ + '/../../assets/img/Tech/92.png')
			@image22.set_from_file(__dir__ + '/../../assets/img/Tech/92.png')

		elsif(@page == 6) then 
			@text1.set_label(@textIle10)

			#Change les images
			@image11.set_from_file(__dir__ + '/../../assets/img/Tech/101.png')
			@image12.set_from_file(__dir__ + '/../../assets/img/Tech/102.png')

			@text2.set_label(@textIle11)

			#Change les images
			@image21.set_from_file(__dir__ + '/../../assets/img/Tech/111.png')
			@image22.set_from_file(__dir__ + '/../../assets/img/Tech/112.png')

		elsif(@page == 7) then 
			@text1.set_label(@textIle12)

			#Change les images
			@image11.set_from_file(__dir__ + '/../../assets/img/Tech/121.png')
			@image12.set_from_file(__dir__ + '/../../assets/img/Tech/122.png')

			@text2.set_label(@textIle13)

			#Change les images
			@image21.set_from_file(__dir__ + '/../../assets/img/Tech/131.png')
			@image22.set_from_file(__dir__ + '/../../assets/img/Tech/132.png')

		end

		@text1.style_context.add_class("texte")
		@text2.style_context.add_class("texte")
	end


# ---------------------------------------------------------------------------------------------------------------------------------

		#Bloque le bouton concerné s'il n'y a pas de page précédente ou suivante
	   	def updateSensitive()
	   		if @page <=1 then
	   			@boutonRetour.set_sensitive(false)
	   			@boutonAvance.set_sensitive(true)
	   		elsif @page>=7 then
	   			@boutonAvance.set_sensitive(false)
	   			@boutonRetour.set_sensitive(true)
	   		else
	   			@boutonAvance.set_sensitive(true)
	   			@boutonRetour.set_sensitive(true)
	   		end
	   	end

		#Met à jour le numéro de page
		def updateLabelPage(labelPage)
			s = "PAGE " + @page.to_s
			labelPage.set_label(s)
		end

		#Met le contenu de la page suivante
		def updateFront()
			if(@page>=7) then
				@boutonAvance.set_sensitive(false)
			else
				@boutonAvance.set_sensitive(true)
				@page = @page + 1
			end
		end

		#Met le contenu de la page précédente
		def updateBack()
			if(@page<=1) then
				@boutonRetour.set_sensitive(false)
			else
				@boutonRetour.set_sensitive(true)
				@page = @page - 1
			end
		end



end