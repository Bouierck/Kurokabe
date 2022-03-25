
##
# Auteur Jérémy Bourgouin & Oussama Belkadi
# Date : Vendredi 25/02 2022 11:36
#
require 'gtk3'
require_relative '../Boutons/BoutonSpecial.rb'
require_relative '../Boutons/BoutonPause.rb'
require_relative '../Boutons/BoutonNiveau.rb'
require_relative '../Boutons/boutonMenu.rb'
require_relative './Historique.rb'
require_relative './Grille.rb'
require_relative './Chronometre.rb'
require_relative '../Aide/Resolveur.rb'
require_relative '../Menu/MenuPrincipal.rb'
require_relative '../Menu/MenuPause.rb'

class Niveau < Gtk::Builder


    ##
    #@idNiveau => Numero du niveau 
    #@grille => Bouton pour accéder a la grille
    #@tailleFenetre => est de type boolean pour savoir la la fenetre est en taille reduite ou en grande taille (false -> petite fenetre) ( true -> grande fenetre)
    def initialize(idNiveau,uneGrille)
        @idNiveau = idNiveau
        @grille = uneGrille
        @tailleFenetre = false
    end

    ##
    #Methode de creation de niveau
    def Niveau.Creer(idNiveau,uneGrille)
        new(idNiveau,uneGrille)
    end




    #changement de la représentation en fonction de la taille de la fenetre 
    def FenetreTaille()
        
    end 


    ##
    #Affichage de la fenetre du niveau
    def NiveauAffiche()

        resolveur = new Resolveur()
        historique = new Historique()
        menuPrincipal = new MenuPrincipal()
        menuPause = new MenuPause()
        uneGrille = new Grille()
        chrono = new Chronometre() 
        chrono.creerChrono(0)

        BoutonSpecial boutonArriere= BoutonSpecial.creer("retour arriere",2,2,historique.RetourArriere())
        BoutonSpecial boutonAvant = BoutonSpecial.creer("retour avant",2,2,historique.RetourAvant())
        BoutonPause boutonPause = BoutonPause.creer("Pause",2,10,menuPause.show_all,@idNiveau)
        BoutonSpecial boutonReinitialiser = BoutonSpecial.creer("reinitialiser",2,2,@grille)
        BoutonNiveau boutonNiveau = BoutonNiveau.creer("niveau",2,10,@idNiveau)
        BoutonSpecial boutonAide = BoutonSpecial.creer("aide",2,2,resolveur.resoudreGrille())
        BoutonSpecial boutonErreur = BoutonSpecial.creer("erreur",2,2,chrono.compareGrille())
        BoutonSpecial boutonQuitter = BoutonSpecial.creer("quitter",2,10,QuitterFenetre())
        BoutonMenu boutonMenu = BoutonMenu.creer("Menu",2,10,menuPrincipal.show_all)
        

        #Creation de la fenetre 
        window = Gtk::Window.set("Test Niveaux")
        window.fullscreen
        window.set_border_width(5)

        #Creation du container pour tous les boutons (important pour contriler la taille ou encore ou ils sont positionné sur l'application)
        grid = Gtk::Grid.new
        window.add(grid)

        #Mise en place des boutons  
        boutonPause = Gtk::Button.new
        #place le bouton sur la cellule 2,0 et de taille 1,1 donc 1 horizontalement et 1 verticalement 
        grid.attach(boutonPause,2,0,2,10)
        window.add(boutonPause)

        boutonNiveau = Gtk::Button.new
        grid.attach(boutonNiveau,3,1,2,10)
        window.add(boutonNiveau)

        boutonQuitter = Gtk::Button.new
        grid.attach(boutonQuitter,6,1,2,10)
        window.add(boutonQuitter)

        boutonMenu = Gtk::Button.new
        grid.attach(boutonMenu,5,1,2,10)
        window.add(boutonMenu)


        boutonArriere = Gtk::Button.new
        grid.attach(boutonArriere,0,0,1,1)
        window.add(boutonArriere)

        boutonAvant = Gtk::Button.new
        grid.attach(boutonAvant,0,0,1,1)
        window.add(boutonAvant)

        boutonReinitialiser = Gtk::Button.new
        grid.attach(boutonReinitialiser,0,0,1,1)
        window.add(boutonReinitialiser)

        boutonAide = Gtk::Button.new
        grid.attach(boutonAide,0,0,1,1)
        window.add(boutonAide)



        #Affichage de la fenetre 
        window.show_all
    end

    def QuitterFenetre()
        window.destroy
    end 

end # Marqueur de fin de classe

niveau = Niveau.Creer(1,2)
niveau.NiveauAffiche()

