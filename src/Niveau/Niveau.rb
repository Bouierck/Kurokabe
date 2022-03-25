
##
# Auteur Jérémy Bourgouin & Oussama Belkadi
# Date : Vendredi 25/02 2022 11:36
#
require 'gtk3'
require_relative '../Boutons/BoutonSpecial.rb'
require_relative '../Boutons/BoutonPause.rb'
require_relative '../Boutons/BoutonNiveau.rb'
require_relative '../Boutons/BoutonMenu.rb'
require_relative './Grille.rb'
require_relative './Chronometre.rb'

class Niveau < Gtk::Builder


    ##
    #@idNiveau => Numero du niveau 
    #@tailleFenetre => est de type boolean pour savoir la la fenetre est en taille reduite ou en grande taille (false -> petite fenetre) ( true -> grande fenetre)
    def initialize(idNiveau, unUtilisateur, unMode)
        @mode =unMode
        @utilisateur = unUtilisateur
        @idNiveau = idNiveau
        @tailleFenetre = false

        #@resolveur = new Resolveur()
        #@historique = new Historique()
        #@menuPrincipal = new MenuPrincipal()
        #@menuPause = new MenuPause()
        @grille = Grille.creer(@utilisateur,"level" + @idNiveau.to_s, @mode)
        @chrono = Chronometre.creerChrono()
    end

    ##
    #Methode de creation de niveau
    def Niveau.Creer(idNiveau, unUtilisateur, unMode)
        new(idNiveau,unUtilisateur,unMode)
    end 



    #changement de la représentation en fonction de la taille de la fenetre 
    def FenetreTaille()
        
    end 


    ##
    #Affichage de la fenetre du niveau
    def NiveauAffiche()


        # BoutonSpecial boutonArriere= BoutonSpecial.creer("retour arriere",2,2,historique.RetourArriere())
        # BoutonSpecial boutonAvant = BoutonSpecial.creer("retour avant",2,2,historique.RetourAvant())
        # BoutonPause boutonPause = BoutonPause.creer("Pause",2,10,menuPause.show_all,@idNiveau)
        # BoutonSpecial boutonReinitialiser = BoutonSpecial.creer("reinitialiser",2,2,@grille)
        # BoutonNiveau boutonNiveau = BoutonNiveau.creer("niveau",2,10,@idNiveau)
        # BoutonSpecial boutonAide = BoutonSpecial.creer("aide",2,2,resolveur.resoudreGrille())
        # BoutonSpecial boutonErreur = BoutonSpecial.creer("erreur",2,2,@grille.methode(:compareGrille))
        boutonQuitter = BoutonSpecial.creer("quitter",2,10,self.method(:QuitterFenetre))
        # BoutonMenu boutonMenu = BoutonMenu.creer("Menu",2,10,menuPrincipal.show_all)
        

        #Creation de la fenetre 
        window = Gtk::Window.new
        window.set_default_size(650,700)
        window.set_border_width(5)

        #Creation du container pour tous les boutons (important pour contriler la taille ou encore ou ils sont positionné sur l'application)
        grid = Gtk::Grid.new
        window.add(grid)
        grid.attach(@grille,3,0,3,1)
        grid.attach(@chrono,3,1,3,1)

        #Mise en place des boutons  
        # boutonPause = Gtk::Button.new
        # #place le bouton sur la cellule 2,0 et de taille 1,1 donc 1 horizontalement et 1 verticalement 
        # grid.attach(boutonPause,2,0,2,10)
        # window.add(boutonPause)

        # boutonNiveau = Gtk::Button.new
        # grid.attach(boutonNiveau,3,1,2,10)
        # window.add(boutonNiveau)

        grid.attach(boutonQuitter,6,1,2,2)

        # boutonMenu = Gtk::Button.new
        # grid.attach(boutonMenu,5,1,2,10)
        # window.add(boutonMenu)


        # boutonArriere = Gtk::Button.new
        # grid.attach(boutonArriere,0,0,1,1)
        # window.add(boutonArriere)

        # boutonAvant = Gtk::Button.new
        # grid.attach(boutonAvant,0,0,1,1)
        # window.add(boutonAvant)

        # boutonReinitialiser = Gtk::Button.new
        # grid.attach(boutonReinitialiser,0,0,1,1)
        # window.add(boutonReinitialiser)

        # boutonAide = Gtk::Button.new
        # grid.attach(boutonAide,0,0,1,1)
        # window.add(boutonAide)

        #lancement du chrono
        @chrono.lancer

        #Affichage de la fenetre 
        window.show_all
        Gtk.main
    end

    def QuitterFenetre()
        window.destroy
    end 

end # Marqueur de fin de classe

#niveau = Niveau.Creer(1,Utilisateur.creer("Stun",1),"aventure")
#niveau.NiveauAffiche()

