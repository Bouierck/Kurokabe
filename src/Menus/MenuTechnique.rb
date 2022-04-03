require 'gtk3'
require_relative '../Boutons/BoutonRetour.rb'

##
# Widget graphique représentant l'écran d'accueil.
class MenuTechnique < Gtk::Box

    attr_reader :titlebar
    def initialize(app)
        super(:vertical, 10)

        @page = 1
        @text1 = Gtk::Label.new("This is sparta")
        @text2 = Gtk::Label.new("This is sparta")
        @image11 = Gtk::Image.new(__dir__ + '/../../assets/img/Tech/01.png')
        @image12 = Gtk::Image.new(__dir__ + '/../../assets/img/Tech/02.png')
        @image21 = Gtk::Image.new(__dir__ + '/../../assets/img/Tech/11.png')
        @image22 = Gtk::Image.new(__dir__ + '/../../assets/img/Tech/12.png')

        labelPage = Gtk::Label.new("Page")

	    @boutonRetour = Gtk::Button.new("<")
	    @boutonAvance = Gtk::Button.new(">")


		
        labelPage.tap{ |label|
            label.set_markup("Page")
        label.show 
        }

        @boutonRetour.tap{|bouton| 
                bouton.signal_connect("clicked") { 
                    @page - 1
                    updateLabelPage(labelPage)
                }
            bouton.show		}
        @boutonAvance.tap{|bouton| 
            bouton.signal_connect("clicked") { 
                @page - 1
                updateLabelPage(labelPage)
            }
        bouton.show		}



        topbox=Gtk::Box.new(:horizontal).tap { |boite|
            boite.pack_start(@boutonRetour)
            boite.pack_start(labelPage)
            boite.pack_start(@boutonAvance)
            
            boite.show
        }

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

        imgBox2=Gtk::Box.new(:horizontal).tap { |boite|
            boite.pack_start(@image21)
            boite.pack_start(@image22)
            
            boite.show
        }

        midbox=Gtk::Box.new(:vertical).tap { |boite|
            boite.pack_start(@text1)
            boite.pack_start(imgBox1)
            boite.pack_start(@text2)
            boite.pack_start(imgBox2)
            boite.show
        }

        self.pack_start(midbox)


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
@textIle0 = "
Nurikabe est un puzzle de formation d'îles basé sur une grille rectangulaire avec des indices à différents endroits. 

Le but est de créer des îles en séparant les indices par des murs, de sorte que chaque île contienne exactement un indice 
et que le nombre de cases de chaque île soit égal à la valeur de l'indice. En outre, toutes les îles sont isolées les unes des autres horizontalement et verticalement, 
il n'y a pas de murs de 2x2 ou plus, et tous les murs forment un chemin continu lorsque le puzzle est terminé. 
Dans l'exemple ci-dessous, nous avons un puzzle Nurikabe 6x6 avec six colonnes et six rangées. 

Nous devons maintenant entourer les indices avec des murs selon les règles ci-dessus... mais comment ?
"



# 	#TECH 1
@textIle1 = "
    1. Island of 1

Comme il s'agit d'une île avec un seul carré, nous pouvons l'entourer de murs en ombrant les carrés adjacents horizontalement et verticalement. 
et verticalement adjacents.

    "



#TECH 2
@textIle2 = "2. Indices séparés par un carré

Selon les règles du Nurikabe, tous les indices doivent être séparés les uns des autres par des murs. 
Par conséquent, lorsque deux indices se trouvent sur la même ligne ou colonne et sont séparés par une case, 
la case intermédiaire doit être un mur.

"




#TECH 3
@textIle3 = "



3. Indices adjacents en diagonale

Comme dans l'exemple précédent, lorsque deux indices sont adjacents en diagonale, 
chacune des cases touchant les deux indices doit faire partie d'un mur.

"



#TECH 4
@textIle4 = "Techniques de base

Nous poursuivons maintenant avec les techniques de base, où il est généralement facile de voir quelles cases font partie d'un mur et doivent être ombrées, 
et quelles cases font partie d'une île et doivent être marquées d'un point. Voici quelques façons d'utiliser les techniques de base :
1. Carré entouré

Après avoir résolu les premières étapes en utilisant les techniques de base décrites ci-dessus, le puzzle du diagramme de gauche ci-dessous comporte 
deux carrés entourés surlignés en rouge. Comme ces carrés sont entourés de murs horizontalement et verticalement, ils ne peuvent pas appartenir à une île et doivent donc 
être ombrés pour faire partie d'un mur.

"

#TECH 5
@textIle5 = "
2. L'expansion des murs

Selon les règles du Nurikabe, tous les murs doivent former un seul chemin continu. Si l'on regarde 
le mur à un seul carré dans le diagramme de gauche ci-dessous, la seule façon de le relier aux autres murs est de l'agrandir avec trois carrés sur sa droite, 
comme indiqué dans le diagramme de droite.


"



#TECH 6
@textIle6 = "3. Continuité du mur

Dans le puzzle ci-dessous, si le carré en surbrillance fait partie d'une île, le mur du haut sera cloisonné. 
Par conséquent, pour maintenir la continuité du mur selon les règles du Nurikabe, cette case doit faire partie d'un mur.
"

#TECH 7
@textIle7 = "
4. Agrandissement d'une île à partir d'un indice

Dans de nombreux cas, la façon dont une île peut être agrandie directement à partir d'un indice est claire. Dans le diagramme ci-dessous, l'île du 3 
ne peut être agrandie que vers le haut et l'île du 7 ne peut être agrandie que vers la gauche. Nous allons marquer ces carrés avec des points pour montrer 
qu'ils font partie des îles respectives et ne peuvent pas faire partie d'un mur.


"



#TECH 8
@textIle8 = "5. Île extensible uniquement dans deux directions

Dans certains cas, une île de 2 ou la dernière case d'une île plus grande ne peut être agrandie que dans deux directions perpendiculaires. 
Dans ce cas, quelle que soit la direction dans laquelle l'extension de l'îlot aura lieu, la case diagonale doit faire partie d'un mur et est 
donc grisée comme indiqué dans le schéma de droite ci-dessous.

"

#TECH 9
@textIle9 = "6. Extension des îles cachées

Parfois, une île est trop grande pour tenir dans une zone donnée. Dans le puzzle partiellement résolu ci-dessous, 
l'île de 12 ne peut pas tenir dans la zone du haut et doit donc s'étendre vers le bas, comme indiqué par un point dans le diagramme de droite. 
Notez que la case située à gauche de ce point ne peut appartenir à aucune île et qu'elle est donc ombragée pour faire partie d'un mur.

"


#TECH 10
@textIle10 = "7. Continuité de l'îlot

La case marquée d'un point rouge dans le schéma de gauche ci-dessous doit faire partie d'une île pour éviter une surface de mur de 2x2. 
Cela signifie que la case située à sa gauche doit également faire partie de la même île et est donc également marquée d'un point. 
L'île de 3 est maintenant terminée et nous pouvons l'entourer d'un mur.

"
#TECH 11
@textIle11 = "8. Entourer une île terminée

Dans l'énigme partiellement résolue ci-dessous, l'île de 3 a été complétée comme le montre la zone en surbrillance. 
Nous pouvons maintenant entourer cette île de murs adjacents horizontalement et verticalement, comme le montre l'image de droite.

"
#TECH 12
@textIle12 = "9. Éviter les surfaces murales de 2x2

Selon les règles, il est interdit d'avoir des murs de 2x2 ou plus. Par conséquent, 
le carré surligné ci-dessous ne peut pas faire partie du mur et est marqué d'un point indiquant qu'il appartient à l'une des îles.

"
#TECH 13
@textIle13 = "10. Carré inaccessible

Dans certains cas, une case ne peut appartenir à aucune île, tout simplement parce qu'aucun indice ne peut l'atteindre. 
Dans l'exemple ci-dessous, les deux cases surlignées sont trop éloignées des indices et ne peuvent faire partie d'aucune île. 
Elles sont donc ombragées pour indiquer qu'elles doivent faire partie d'un mur.

"



# ------------------------------------------FIN TEXT TECHNIQUES-----------------------------------------------------------------------


@image11.clear()
@image21.clear()
@image21.clear()
@image22.clear()

        updateLabelPage(labelPage)
	    updateSensitive()
	    updatePage()


        self.show

        @titlebar = Gtk::HeaderBar.new.tap { |barre|
                barre.title = "Nurikabe"
                barre.show_close_button = true
                barre.pack_start(BoutonRetour.new.tap { |bouton|
                    bouton.sensitive = true
                    bouton.signal_connect("clicked") { app.regles }
                })
                barre.show
            }

    end


# ---------------------------------------------------------------------------------------------------------


    def updatePage()
		if(@page == 1) then
			@text1.set_label(@textIle0)
			@image11.set_from_file(__dir__ + '/../../assets/img/Tech/01.png')
			@image12.set_from_file(__dir__ + '/../../assets/img/Tech/02.png')
			@text2.set_label(@textIle1)
			@image21.set_from_file(__dir__ + '/../../assets/img/Tech/11.png')
			@image22.set_from_file(__dir__ + '/../../assets/img/Tech/12.png')
		elsif(@page == 2) then 
			@text1.set_label(@textIle2)
			@image11.set_from_file(__dir__ + '/../../assets/img/Tech/21.png')
			@image12.set_from_file(__dir__ + '/../../assets/img/Tech/22.png')
			@text2.set_label(@textIle3)
			@image21.set_from_file(__dir__ + '/../../assets/img/Tech/31.png')
			@image22.set_from_file(__dir__ + '/../../assets/img/Tech/32.png')
		elsif(@page == 3) then 
			@text1.set_label(@textIle4)
			@image11.set_from_file(__dir__ + '/../../assets/img/Tech/41.png')
			@image12.set_from_file(__dir__ + '/../../assets/img/Tech/42.png')
			@text2.set_label(@textIle5)
			@image21.set_from_file(__dir__ + '/../../assets/img/Tech/52.png')
			@image22.set_from_file(__dir__ + '/../../assets/img/Tech/52.png')
		elsif(@page == 4) then 
			@text1.set_label(@textIle6)
			@image11.set_from_file(__dir__ + '/../../assets/img/Tech/61.png')
			@image12.set_from_file(__dir__ + '/../../assets/img/Tech/62.png')
			@text2.set_label(@textIle7)
			@image21.set_from_file(__dir__ + '/../../assets/img/Tech/72.png')
			@image22.set_from_file(__dir__ + '/../../assets/img/Tech/72.png')
		elsif(@page == 5) then 
			@text1.set_label(@textIle8)
			@image11.set_from_file(__dir__ + '/../../assets/img/Tech/81.png')
			@image12.set_from_file(__dir__ + '/../../assets/img/Tech/82.png')
			@text2.set_label(@textIle9)
			@image21.set_from_file(__dir__ + '/../../assets/img/Tech/92.png')
			@image22.set_from_file(__dir__ + '/../../assets/img/Tech/92.png')
		elsif(@page == 6) then 
			@text1.set_label(@textIle10)
			@image11.set_from_file(__dir__ + '/../../assets/img/Tech/101.png')
			@image12.set_from_file(__dir__ + '/../../assets/img/Tech/102.png')
			@text2.set_label(@textIle11)
			@image21.set_from_file(__dir__ + '/../../assets/img/Tech/111.png')
			@image22.set_from_file(__dir__ + '/../../assets/img/Tech/112.png')
		elsif(@page == 7) then 
			@text1.set_label(@textIle12)
			@image11.set_from_file(__dir__ + '/../../assets/img/Tech/121.png')
			@image12.set_from_file(__dir__ + '/../../assets/img/Tech/122.png')
			@text2.set_label(@textIle13)
			@image21.set_from_file(__dir__ + '/../../assets/img/Tech/131.png')
			@image22.set_from_file(__dir__ + '/../../assets/img/Tech/132.png')
		end
	end


# ---------------------------------------------------------------------------------------------------------------------------------


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

		def updateLabelPage(labelPage)
			s = "Page " + @page.to_s
			labelPage.set_label(s)
		end

		def updateFront()
			if(@page>=7) then
				@boutonAvance.set_sensitive(false)
			else
				@boutonAvance.set_sensitive(true)
				@page = @page + 1
			end
		end

		def updateBack()
			if(@page<=1) then
				@boutonRetour.set_sensitive(false)
			else
				@boutonRetour.set_sensitive(true)
				@page = @page - 1
			end
		end



end