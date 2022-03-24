##
# Auteur Jérémy Bourgouin & Oussama Belkadi
# Date : Vendredi 25/02 2022 11:36
#
require 'gtk3'


class Niveau < Gtk::Builder

    ##
    #@idNiveau => Numero du niveau 
    #@grille => Bouton pour accéder a la grille
    #@tailleFenetre => est de type boolean pour savoir la la fenetre est en taille reduite ou en grande taille (false -> petite fenetre) ( true -> grande fenetre)
    #@Chrono => ce type int qui correspond au chronometre du niveau

    def initialize(idNiveau,uneGrille)
        @idNiveau = idNiveau
        @grille = uneGrille
        @tailleFenetre = false
    end

    ##
    #Methode de creation de niveau
    def Niveau.Creer()
        new(idNiveau,uneGrille)
    end



    #changement de la représentation en fonction de la taille de la fenetre 
    def FenetreTaille()
        
    end 

    ##
    #Affichage de la fenetre du niveau
    def NiveauAffiche()

        BoutonSpecial boutonArriere= BoutonSpecial.creer(Historique.RetourArriere())
        BoutonSpecial boutonAvant = BoutonSpecial.creer(Historique.RetourAvant())
        BoutonPause boutonPause = BoutonPause.creer()
        BoutonSpecial boutonReinitialiser = BoutonSpecial.creer()
        

        #Creation de la fenetre 
        window = Gtk::Window.set("Test Niveaux")
        window.set_size_request(400,700)
        window.set_border_width(5)

        #Creation du container pour tous les boutons (important pour contriler la taille ou encore ou ils sont positionné sur l'application)
        grid = Gtk::Grid.new
        window.add(grid)

        #Mise en place du bouton menu et action effectue lors du click dessus 
        button_pause = Gtk::Button.new(:label => "NIVEAU")
        button.signal_connect(clicked){
        #mettre l'action du bouton niveau pour le retour sur le menu
        #MenuNiveaux.show_all
        puts "niveau"
        }
        #place le bouton sur la cellule 0,0 et de taille 1,1 donc 1 horizontalement et 1 verticalement 
        grid.attach(button_pause,0,0,1,1)
        window.add(button_pause)

        #Mise en place du bouton menu et action effectue lors du click dessus 
        button_pause = Gtk::Button.new(:label => "MENU")
        button.signal_connect(clicked){
        #mettre l'action du bouton menu pour le retour sur le menu
        #Menu.show_all
        puts "menu"
        }
        #place le bouton sur la cellule 0,0 et de taille 1,1 donc 1 horizontalement et 1 verticalement 
        grid.attach(button_pause,0,0,1,1)
        window.add(button_pause)

        #Mise en place du bouton menu et action effectue lors du click dessus 
        button_pause = Gtk::Button.new(:label => "REINITIALISER")
        button.signal_connect(clicked){
        #mettre l'action du bouton reinitialiser pour le retour sur le menu
        puts "niveau"
        }
        #place le bouton sur la cellule 0,0 et de taille 1,1 donc 1 horizontalement et 1 verticalement 
        grid.attach(button_pause,0,0,1,1)
        window.add(button_pause)

        #Mise en place du bouton pause et action effectue lors du click dessus 
        button_pause = Gtk::Button.new(:label => "PAUSE")
        button.signal_connect(clicked){
        #mettre l'action du bouton pause
        #boutonPause.lanceToi() -> lancer l'action du bouton pause ?
        puts "jeu en pause"
        }
        #place le bouton sur la cellule 0,0 et de taille 1,1 donc 1 horizontalement et 1 verticalement 
        grid.attach(button_pause,0,0,1,1)
        window.add(button_pause)

        #Mise en place du bouton aide et action effectue lors du click dessus 
        button_pause = Gtk::Button.new(:label => "AIDE")
        button.signal_connect(clicked){
        #mettre l'action de l'aide 
        puts "aide activée"
        }
        #place le bouton sur la cellule 1,0 et de taille 1,1 donc 1 horizontalement et 1 verticalement 
        grid.attach(button_pause,1,0,1,1)
        window.add(button_pause)


        #Mise en place du bouton quitter et action effectue lors du click dessus 
        button_pause = Gtk::Button.new(:label => "QUITTER")
        button.signal_connect(clicked){
            window.destroy
        }
        #place le bouton sur la cellule 1,0 et de taille 2,1 donc 2 horizontalement et 1 verticalement 
        grid.attach(button_pause,0,1,2,1)
        window.add(button_pause)


        #Affichage
        window.show_all
    end

    def lanceToi()

        if FenetreTaille == true  

        else 
            
        end 
    end
end # Marqueur de fin de classe