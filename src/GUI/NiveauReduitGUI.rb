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
    def NiveauReduitGUI.creer(app,niveau)
        new(app,niveau)
    end

    def initialize(app, niveau)

        super(:vertical,3)
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

        #Reduire la fentre 
        @app.fenetre.signal_connect('size_allocate'){|w,e|
            puts(e.width)
            if(e.width >= 900 )
                m = NiveauGUI.creer(@app,@niveau)
                @app.fenetre.remove(self) if(@app.fenetre.child)
                @app.fenetre.child = m
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
        @boxReduite = Gtk::Box.new(:vertical,3)
        
        
        @boxReduite.valign = Gtk::Align::CENTER
        @boxReduite.halign = Gtk::Align::CENTER
        
        
        boxFonctionreduit = Gtk::Box.new(:horizontal,5)
        boxFonctionreduit.valign = Gtk::Align::CENTER
        boxFonctionreduit.halign = Gtk::Align::CENTER



        @chronoLabelReduit = ChronoGUI.creer(@niveau.chrono)
        @chronoLabelReduit.style_context.add_class("chrono1")
        @chronoLabelReduit.valign = Gtk::Align::CENTER



        @boutonreduitPause = BoutonPause.creer("⏸", 2, 2, self)
        @boutonreduitPause.style_context.add_class("bouton")
        @boutonreduitPause.valign = Gtk::Align::CENTER


        
        niveauLabelReduit = Gtk::Label.new("1."+@niveau.id.to_s)
        niveauLabelReduit.style_context.add_class("titre")
        niveauLabelReduit.valign = Gtk::Align::CENTER


            
        @boxMenuReduit = Gtk::Box.new(:horizontal,3)
        @boxMenuReduit.halign = Gtk::Align::CENTER

        @boxMenuReduit.add(@boutonreduitPause)
        @boxMenuReduit.add(@chronoLabelReduit)
        @boxMenuReduit.add(niveauLabelReduit)

        @boxMenuReduit.style_context.add_class("margin-top2")
        @boxMenuReduit.style_context.add_class("margin-bot3")

            
        @boutonArriereReduit= BoutonSpecial.creer("↶", 1, 1, self.method(:clickRetourArriere))
        @boutonArriereReduit.style_context.add_class("bouton")

        @boutonAvantReduit = BoutonSpecial.creer("↷", 2, 2, self.method(:clickRetourAvant))
        @boutonAvantReduit.style_context.add_class("bouton")
            
        @boutonReinitialiserReduit = BoutonSpecial.creer("↻", 2, 2, self.method(:clickReinitialiserGrille))
        @boutonReinitialiserReduit.style_context.add_class("bouton")
            
        @boutonCheckReduit = BoutonSpecial.creer("👁️", 2, 2, self.method(:check))
        @boutonCheckReduit.style_context.add_class("bouton")
            
        @boutonIndiceReduit = BoutonSpecial.creer("💡", 2, 2, self.method(:appelResoudreGrille))
        @boutonIndiceReduit.style_context.add_class("bouton")
            
        boxFonctionreduit.add(@boutonArriereReduit)
        boxFonctionreduit.add(@boutonAvantReduit)
        boxFonctionreduit.add(@boutonReinitialiserReduit)
        boxFonctionreduit.add(@boutonCheckReduit)
        boxFonctionreduit.add(@boutonIndiceReduit)

        @grilleGUI.style_context.add_class("margin-bot3")
        boxFonctionreduit.style_context.add_class("margin-bot2")
            
        self.add(@boxMenuReduit)
        self.add(@grilleGUI)
        self.add(boxFonctionreduit)

        self.show_all


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

        @boutonReprendre = BoutonPause.creer(Langue.text("continuer"), 2, 10, self)
        @boutonReprendre.style_context.add_class("bouton")

        @boutonMenuPause = BoutonMenu.creer(Langue.text("ingameMenu"), 2, 10, MenuNiveaux.method(:new), @app)
        @boutonMenuPause.style_context.add_class("bouton")

        @boutonQuitterPause = BoutonSpecial.creer(Langue.text("ingameQuitter"), 2, 20, self.method(:QuitterFenetre))
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

            self.remove(@boxMenuReduit)
            self.remove(@grilleGUI)
            self.remove(boxFonctionreduit)

            # box = Gtk::Box.new(:vertical,2)

            # box.add(Gtk::Label.new(@niveau.chrono.to_s))
            # box.add(@boxPause)

            self.add(@boxPause)

            self.show_all
        else
            @pause = false
            @chronoLabel.lancer if @niveau.grille.estFini? == false

            self.remove(@boxPause)

            self.add(@boxMenuReduit)
            self.add(@grilleGUI)
            self.add(boxFonctionreduit)

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
