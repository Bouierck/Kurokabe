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


    ###################
    #retour niveau, menu, pause(reprendre, niveau, menu, quitter), quitter
    ###################
    ###########
    #Positionner les BoutonSpecial
    ###########



    def AfficherBoutton()
        if (tailleFenetre == false ){
            BoutonSpecial.AfficheBoutonArriere()
            BoutonSpecial.AfficheBoutonAvant()
            BoutonSpecial.AfficheBoutonAide()
        }
        
        BoutonPause.application.show_all
        BoutonMenu.application.show_all
    end 


    def LancerBouton()

        BoutonSpecial boutonArriere= BoutonSpecial.creer(Historique.RetourArriere())
        BoutonSpecial boutonAvant = BoutonSpecial.creer(Historique.RetourAvant())
        
    end 

    #changement de la représentation en fonction de la taille de la fenetre 
    def FenetreTaille()
        
    end 

    ##
    #Affichage de la fenetre du niveau
    def AfficheToi(){
        window = Gtk::Window.set("Test Niveaux")
        window.set_size_request(400,700)
        window.set_border_width(5)

        button_pause = Gtk::Button.new(:label => "PAUSE")
        button.signal_connect "clicked" do |_widget|
            #mettre l'action du bouton pause 
            puts "jeu en pause"
        end 

        window.add(button)
        window.signal_connect("delete-event"){
            |_widget| Gtk.main_quit
        }

        window.show_all
    }

    def lanceToi(){

        if FenetreTaille == true   
        else 
        end 
    }
end # Marqueur de fin de classe