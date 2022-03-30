require_relative '../Niveau/Niveau.rb'

require 'gtk3'

class Niveau < Gtk::Builder

    ##
    # @niveau => niveau représenté paar ce GUI

    ##
    #Constructeur du niveau
    def Niveau.Creer(niveau)
        new(niveau)
    end 

    def initialize(niveau)
        @niveau = niveau
    end


    ##
    #Affichage de la fenetre du niveau
    def NiveauAffiche()

        boutonArriere= BoutonSpecial.creer("retour arriere",1,1,@grille.historique.method(:retourArriere))
        boutonAvant = BoutonSpecial.creer("retour avant",2,2,@grille.historique.method(:retourAvant))
        boutonPause = BoutonPause.creer("Pause",2,10,Menu.new,self)
        boutonReinitialiser = BoutonSpecial.creer("reinitialiser",2,2,@grille)
        boutonNiveau = BoutonNiveau.creer("niveau",2,10,@idNiveau)
        #boutonCheck = BoutonSpecial.creer("check",2,2,resolveur.resoudreGrille())
        boutonIndice = BoutonSpecial.creer("indice",2,2,@grille.method(:compareGrille))
        boutonQuitter = BoutonSpecial.creer("quitter",2,20,self.method(:QuitterFenetre))
        boutonMenu = BoutonMenu.creer("Menu",2,10,Menu.new)
        

        #Creation de la fenetre 
        window = Gtk::Window.new
        #window.set_default_size(650,700)
        window.set_border_width(5)
        window.set_window_position(Gtk::WindowPosition::CENTER_ALWAYS)

        #Creation header
        header = Gtk::HeaderBar.new
        header.show_close_button = true
        header.name = "headerbar"
        header.title = "Kurikabe"
        header.subtitle = " "
        window.titlebar = header

        #Creation du container pour tous les boutons (important pour contriler la taille ou encore ou ils sont positionné sur l'application)
        box = Gtk::Box.new(:horizontal,2)
        box.can_focus = false
        box.set_homogeneous(true)
        box.set_spacing(3)

        @grille.set_margin_left(50)
        @grille.set_margin_right(50)
        @grille.set_margin_top(59)
        @grille.set_margin_bottom(80)
        box.add(@grille)

        boxDroite = Gtk::Box.new(:vertical,7)
        boxDroite.set_margin_left(50)
        boxDroite.set_margin_right(50)
        boxDroite.set_margin_top(15)
        boxDroite.set_margin_bottom(15)
        boxDroite.set_homogeneous(true)
        boxDroite.set_spacing(23)
        boxDroite.set_homogeneous(true)

        nomNiveau=Gtk::Label.new()
        nomNiveau.set_markup("Niveau #{@idNiveau}")
        nomNiveau.set_justify(:center)

        boxDroite.add(nomNiveau)
        boxDroite.add(@chrono.lancer)
        boxDroite.add(boutonPause)
        boxDroite.add(boutonNiveau)

        #Ajout des boutons d'aide
        boxAide = Gtk::Box.new(:horizontal,5)
        boxAide.set_homogeneous(false)

        boxAide.add(boutonArriere)
        boxAide.add(boutonAvant)
        #boxAide.add(boutonCheck)
        #boxAide.add(boutonReinitialiser)
        #boxAide.add(boutonIndice)
        
        boxDroite.add(boxAide)
        boxDroite.add(boutonMenu)
        boxDroite.add(boutonQuitter)
        
        box.add(boxDroite)

        #Affichage de la fenetre 
        window.add(box)
        window.show_all
        Gtk.main
    end

    def QuitterFenetre()
        window.destroy
    end 


end # Marqueur de fin de classe

# niveau = Niveau.Creer(1,Utilisateur.creer("Jeremy",1),"aventure")
# niveau.NiveauAffiche()
# Gtk.main
