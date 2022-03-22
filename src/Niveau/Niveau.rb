##
# Auteur Jérémy Bourgouin & Oussama Belkadi
# Date : Vendredi 25/02 2022 11:36
#
require 'gtk3'

class Niveau

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

    def lanceToi(){
        
        window = Gtk::Window.new
        window.set_default_size(300,700)
        window.show_all

        BoutonSpecial boutonArriere= BoutonSpecial.creer(Historique.RetourArriere())

        if FenetreTaille == true
            Grille.grilleAfficher()
            AfficherBoutton()
            LancerBouton()
        else 
            Grille.grilleAfficher()
        end 
    }
end # Marqueur de fin de classe