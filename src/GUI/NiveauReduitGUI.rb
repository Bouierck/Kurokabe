require_relative '../Niveau/Niveau.rb'

require_relative '../Menus/MenuNiveaux.rb'

require_relative '../Boutons/BoutonSpecial.rb'
require_relative '../Boutons/BoutonPause.rb'
require_relative '../Boutons/BoutonNiveau.rb'
require_relative '../Boutons/BoutonMenu.rb'

require_relative './GrilleGUI.rb'
require_relative './ChronoGUI.rb'

require 'gtk3'

##
# Représente l'aspect graphique d'un niveau
# contient le GUI de la grille
# ainsi que les différent boutons
#
class NiveauReduitGUI < Gtk::Box

    ##
    # @niveau => niveau représenté par ce GUI

    attr_reader :titlebar

    ##
    # Constructeur du niveau
    #
    # === Attributes
    #
    # * -app- fenetre de l'application
    # * -niveau- niveau représenté par ce GUI
    #
    # def NiveauReduitGUI.creer(app, niveau)
    #     new(app, niveau)
    # end
    def NiveauReduitGUI.creer(app,niveauGUI)
        new(app,niveauGUI)
    end

    def initialize(app, niveauGUI)

        super(:vertical,3)

        @niveauGUI = niveauGUI
        @grilleGUI = @niveauGUI.grilleGUI
        @app = app;
        @pause = @niveauGUI.pause;
        initGUI

    end

    ##
    # Initialise le GUI du niveau
    #
    def initGUI

        #Reduire la fentre 
        @app.fenetre.signal_connect('size_allocate'){|w,e|
            puts(e.width)
            if(e.width >= 900 )
                @boxMenu.remove(@chronoLabel)
        
                boxFonction.remove(@boutonArriere)
                boxFonction.remove(@boutonAvant)
                boxFonction.remove(@boutonReinitialiser)
                boxFonction.remove(@boutonCheck)
                boxFonction.remove(@boutonIndice)
        
                self.remove(@grilleGUI)
                niveauGUI.init
            end
        }


        #Centre les éléments
        self.valign = Gtk::Align::CENTER
        self.halign = Gtk::Align::CENTER

        @app.fenetre.resize(800,600)

        #title bar et bouton retour
        @titlebar = Gtk::HeaderBar.new
        @titlebar.title = "Nurikabe"
        @titlebar.show_close_button = true
        @titlebar.show


        #Box du menu en haut
        @boxMenu = Gtk::Box.new(:horizontal,3)

        #Menu du haut avec pause, chrono et le nom du niveau
        @boutonPause = BoutonPause.creer("⏸", 2, 2, self)
        @boutonPause.style_context.add_class("bouton-pause")

        niveauLabel = Gtk::Label.new(@niveauGUI.niveau.id.to_s)
        niveauLabel.style_context.add_class("titre")

        @chronoLabel = @niveauGUI.chronoLabel
        @chronoLabel.style_context.add_class("chrono")

        #bouton fonction
        @boxFonction = Gtk::Box.new(:horizontal,5)

        @boutonArriere = @niveauGUI.boutonArriere
        @boutonArriere.style_context.add_class("bouton")

        @boutonAvant = @niveauGUI.boutonAvant
        @boutonAvant.style_context.add_class("bouton")

        @boutonReinitialiser = @niveauGUI.boutonReinitialiser
        @boutonReinitialiser.style_context.add_class("bouton")

        @boutonCheck = @niveauGUI.boutonCheck
        @boutonCheck.style_context.add_class("bouton")

        @boutonIndice = @niveauGUI.boutonIndice
        @boutonIndice.style_context.add_class("bouton")

        @boxMenu.add(@boutonPause)
        @boxMenu.add(@chronoLabel)
        @boxMenu.add(niveauLabel)


        @boxFonction.add(@boutonArriere)
        @boxFonction.add(@boutonAvant)
        @boxFonction.add(@boutonReinitialiser)
        @boxFonction.add(@boutonCheck)
        @boxFonction.add(@boutonIndice)


        # Ajout des deux composant de la box du niveau
        @boxMenu.valign = Gtk::Align::CENTER
        @boxMenu.style_context.add_class("margin-left2")
        self.add(@boxMenu)

        @grilleGUI.style_context.add_class("margin-right2")
        @grilleGUI.valign = Gtk::Align::CENTER
        self.add(@grilleGUI)

        @boxFonction.valign = Gtk::Align::CENTER
        self.add(@boxFonction)

        @chronoLabel.lancer if @niveauGUI.niveau.grille.estFini? == false

        @niveauGUI.show_all




        #Box représentant la pause


        @boxPause = Gtk::Box.new(:vertical,5)

        @boxPause.valign = Gtk::Align::CENTER
        @boxPause.halign = Gtk::Align::CENTER
            
        lbl = Gtk::Label.new.tap{ |label|
            label.set_markup("PAUSE")
            label.style_context.add_class("pause")
            label.style_context.add_class("titre")
            label.show 
        }

        niveauLabelPause = Gtk::Label.new.tap{ |label|
            label.set_markup("Niveau #{@niveauGUI.niveau.id}")
            label.style_context.add_class("titre")
            label.style_context.add_class("margin-bot")
            label.style_context.add_class("pause")
            label.show 
        }

        boutonReprendre = BoutonPause.creer("Reprendre", 2, 10, self)
        boutonReprendre.style_context.add_class("bouton")

        boutonMenuPause = BoutonMenu.creer("Menu", 2, 10, MenuNiveaux.method(:new), @app)
        boutonMenuPause.style_context.add_class("bouton")

        boutonQuitterPause = BoutonSpecial.creer("Quitter", 2, 20, self.method(:QuitterFenetre))
        boutonQuitterPause.style_context.add_class("bouton")

        @boxPause.add(niveauLabelPause)
        @boxPause.add(lbl)
        @boxPause.add(boutonReprendre)
        @boxPause.add(boutonMenuPause)
        @boxPause.add(boutonQuitterPause)


    end

    private

    ##
    # Fait un retour arrière
    # puis update l'affichage de la grille
    #
    def clickRetourArriere
        if @niveau.grille.estFini? == false
            @niveau.historique.retourArriere
            @grilleGUI.updateGrille
        end
    end

    ##
    # Fait un retour avant
    # puis update l'affichage de la grille
    #
    def clickRetourAvant
        if @niveau.grille.estFini? == false
            @niveau.historique.retourAvant
            @grilleGUI.updateGrille
        end
    end

    ##
    # Reinitialise la grille
    # puis update l'affichage de la grille
    #
    def clickReinitialiserGrille
        if @niveau.grille.estFini? == false
            @niveau.historique.reinitialiserGrille
            @grilleGUI.updateGrille
        end
    end

    ##
    # Surbrille les endroits ou il y a des erreurs
    #
    def check
        if @niveau.grille.estFini? == false
            erreurs =  @niveau.grille.compareGrille
            erreurs.each do |c|
                @grilleGUI.matriceGUI[c.y][c.x].style_context.add_class("erreur")
            end
        end
    end

    ##
    # Regarde s'il y a des techniques
    # puis update l'affichage de la grille
    #
    def appelResoudreGrille
        if @niveau.grille.estFini? == false
            indice = @niveau.resolveur.resoudreGrille(@grilleGUI.grille)
            indice.each{ |c|
                @grilleGUI.matriceGUI[c.y][c.x].style_context.add_class("indice")
            }
        end
    end

    ##
    # Quitte l'application
    #
    def QuitterFenetre()
        @app.quit
    end
end
