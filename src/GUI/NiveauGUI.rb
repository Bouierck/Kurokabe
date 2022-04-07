require_relative '../Niveau/Niveau.rb'

require_relative '../Menus/MenuNiveaux.rb'

require_relative '../Boutons/BoutonSpecial.rb'
require_relative '../Boutons/BoutonPause.rb'
require_relative '../Boutons/BoutonNiveau.rb'
require_relative '../Boutons/BoutonMenu.rb'

require_relative './GrilleGUI.rb'
require_relative './ChronoGUI.rb'
require_relative './NiveauReduitGUI.rb'

require 'gtk3'

##
# Représente l'aspect graphique d'un niveau
# contient le GUI de la grille
# ainsi que les différent boutons
#
class NiveauGUI < Gtk::Box

    ##
    # @niveau => niveau représenté par ce GUI

    attr_reader :chronoLabel, :niveau, :pause, :titlebar, :boutonIndice, :grilleGUI, :boutonArriere, :boutonAvant, :boutonReinitialiser, :boutonCheck, :boutonIndice

    ##
    # Constructeur du niveau
    #
    # === Attributes
    #
    # * -app- fenetre de l'application
    # * -niveau- niveau représenté par ce GUI
    #
    def NiveauGUI.creer(app, niveau)
        new(app, niveau)
    end

    def initialize(app, niveau)

        super(:horizontal,2)

        @niveau = niveau
        @grilleGUI = GrilleGUI.creer(@niveau.grille)
        @app = app;
        @pause = false
        initGUI

    end

    ##
    # Initialise le GUI du niveau
    #
    def initGUI



        #Centre les éléments
        self.valign = Gtk::Align::CENTER
        self.halign = Gtk::Align::CENTER	

		@app.fenetre.resize(900,700)
        
        #title bar et bouton retour
        @titlebar = Gtk::HeaderBar.new
        @titlebar.title = "Kurokabe"
        @titlebar.show_close_button = true
        @titlebar.pack_start(BoutonRetour.creer(MenuNiveaux.method(:new), @app).tap {|b|
            b.sensitive = true
            b.show
        })
        @titlebar.show

        #Box du menu
        @boxMenu = Gtk::Box.new(:vertical,6)

        #label du niveau
        niveauLabel = Gtk::Label.new(Langue.text("ingameNiveau") + " " + @niveau.id.to_s)
        niveauLabel.style_context.add_class("titre")

        @chronoLabel = ChronoGUI.creer(@niveau.chrono)
        @chronoLabel.style_context.add_class("chrono")

        #Ajout des boutons du menu

        @boutonMenu = BoutonMenu.creer("MENU", MenuNiveaux.method(:new), @app)
        @boutonMenu.style_context.add_class("bouton")

        @boutonPause = BoutonPause.creer("PAUSE", self)
        @boutonPause.style_context.add_class("bouton-pause")

        @boutonQuitter = BoutonSpecial.creer(Langue.text("quitter"), self.method(:QuitterFenetre))
        @boutonQuitter.style_context.add_class("bouton-quitter")
        
        #bouton fonction
        boxFonction = Gtk::Box.new(:horizontal,5)

        @boutonArriere= BoutonSpecial.creer("↶", self.method(:clickRetourArriere))
        @boutonArriere.style_context.add_class("bouton")

        @boutonAvant = BoutonSpecial.creer("↷", self.method(:clickRetourAvant))
        @boutonAvant.style_context.add_class("bouton")

        @boutonReinitialiser = BoutonSpecial.creer("↻", self.method(:clickReinitialiserGrille))
        @boutonReinitialiser.style_context.add_class("bouton")

        @boutonCheck = BoutonSpecial.creer("👁️", self.method(:check))
        @boutonCheck.style_context.add_class("bouton")

        @boutonIndice = BoutonSpecial.creer("💡", self.method(:appelResoudreGrille))
        @boutonIndice.style_context.add_class("bouton")
        
        boxFonction.add(@boutonArriere)
        boxFonction.add(@boutonAvant)
        boxFonction.add(@boutonReinitialiser)
        boxFonction.add(@boutonCheck)
        boxFonction.add(@boutonIndice)

        @boxMenu.add(niveauLabel)
        @boxMenu.add(@chronoLabel)
        @boxMenu.add(@boutonMenu)
        @boxMenu.add(@boutonPause)
        @boxMenu.add(boxFonction)
        @boxMenu.add(@boutonQuitter)





        #Ajout des deux composant de la box du niveau

        @grilleGUI.style_context.add_class("margin-left2")
        @grilleGUI.valign = Gtk::Align::CENTER
        self.add(@grilleGUI)

        @boxMenu.style_context.add_class("margin-right2")
        @boxMenu.style_context.add_class("margin-left2")
        @boxMenu.valign = Gtk::Align::CENTER
        self.add(@boxMenu)


        @chronoLabel.lancer if @niveau.grille.estFini? == false
	    
	#Reduire la fentre 
        # @app.fenetre.signal_connect('size_allocate'){|w,e|
        #     if(e.width < 945 )
        #         m =NiveauReduitGUI.creer(@app,niveau)
        #         @app.fenetre.remove(self) if(@app.fenetre.child)
        #         @app.fenetre.child = m
        #     end 
        # }

        #Box représentant la pause

        self.show_all

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
            label.set_markup("#{Langue.text("ingameNiveau")} #{@niveau.id}")
            label.style_context.add_class("titre")
            label.style_context.add_class("margin-bot")
            label.style_context.add_class("pause")
            label.show 
        }

        @boutonReprendre = BoutonPause.creer(Langue.text("continuer"), self)
        @boutonReprendre.style_context.add_class("bouton")

        @boutonMenuPause = BoutonMenu.creer(Langue.text("ingameMenu"), MenuNiveaux.method(:new), @app)
        @boutonMenuPause.style_context.add_class("bouton")

        @boutonQuitterPause = BoutonSpecial.creer(Langue.text("ingameQuitter"), self.method(:QuitterFenetre))
        @boutonQuitterPause.style_context.add_class("bouton")

        @boxPause.add(niveauLabelPause)
        @boxPause.add(lbl)
        @boxPause.add(@boutonReprendre)
        @boxPause.add(@boutonMenuPause)
        @boxPause.add(@boutonQuitterPause)
    end

    def modePause()
        if(@pause == false)
            @pause = true
            @chronoLabel.stop

            self.remove(@grilleGUI)
            self.remove(@boxMenu)

            self.add(@boxPause)

            self.show_all
        else
            @pause = false
            @chronoLabel.lancer if @niveau.grille.estFini? == false

            self.remove(@boxPause)

            self.add(@grilleGUI)
            self.add(@boxMenu)

            self.show_all
        end
    end

    ##
    # Fait un retour arrière
    # puis update l'affichage de la grille
    #
    def clickRetourArriere
        if @niveau.grille.estFini? == false
            @niveau.historique.retourArriere
            @grilleGUI.updateGrille
            Sauvegarde.sauvNiveau(@niveau.utilisateur.nom, @niveau, 0)
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
            Sauvegarde.sauvNiveau(@niveau.utilisateur.nom, @niveau, 0)
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
            Sauvegarde.sauvNiveau(@niveau.utilisateur.nom, @niveau, 0)
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
            Sauvegarde.sauvNiveau(@niveau.utilisateur.nom, @niveau, 0)
        end
    end

    ##
    # Regarde s'il y a des techniques
    # puis update l'affichage de la grille
    #
    def appelResoudreGrille
        if @niveau.grille.estFini? == false

            indice = @niveau.resolveur.resoudreGrille(@grilleGUI.grille)
            popup(@grilleGUI, indice[:text], Gtk::PositionType::TOP)

            if(indice[:response] == ReponseType::ARRAY)
                indice[:cases].each{ |c|
                    @grilleGUI.matriceGUI[c.y][c.x].style_context.add_class("indice")
                }
            end

            Sauvegarde.sauvNiveau(@niveau.utilisateur.nom, @niveau, 0)
        end
    end

    def popup(relative, msg, position)

        pop = Gtk::Popover.new()
        pop.set_relative_to(relative)
        pop.add(Gtk::Label.new(msg).show)
        pop.popup
        pop.set_position(position)

    end

    ##
    # Quitte l'application
    #
    def QuitterFenetre()
        Sauvegarde.sauvNiveau(@niveau.utilisateur.nom, @niveau, 0)
        @app.quit
    end
end
