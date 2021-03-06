##
# Un Didacticiel sert a guider l'utilisateur pour lui montrer comment fonction l'interface d'un niveau
#

require_relative '../GUI/NiveauGUI.rb'
require_relative '../GUI/GrilleGUI.rb'

##
# Niveau avec un tuto au début
#
class Didacticiel < NiveauGUI
    ##
    # @niveau => niveau représenté par ce GUI

    ##
    # Initialise le GUI du niveau
    #
    def initGUI
        super

        @titlebar = Gtk::HeaderBar.new
        @titlebar.title = "Kurokabe"
        @titlebar.show_close_button = true
        @titlebar.pack_start(BoutonRetour.creer(MenuPrincipal.method(:new), @app).tap {|b|
            b.sensitive = true
            b.show
        })
        @titlebar.show

        @didactEnCours = true

        #Rend tous les élément des l'interface niveau incliquable
        @boutonMenu.set_sensitive(false)
        @boutonPause.set_sensitive(false)
        @boutonQuitter.set_sensitive(false)

        @boutonArriere.set_sensitive(false)
        @boutonAvant.set_sensitive(false)
        @boutonReinitialiser.set_sensitive(false)
        @boutonCheck.set_sensitive(false)
        @boutonIndice.set_sensitive(false)

        @boutonReprendre.set_sensitive(false)
        @boutonMenuPause.set_sensitive(false)
        @boutonQuitterPause.set_sensitive(false)
        
        @grilleGUI.set_sensitive(true)

        popup(@grilleGUI, Langue.text("didactGrille"), Gtk::PositionType::TOP)     

    end

    ##
    # Fait un retour arrière
    # puis update l'affichage de la grille
    # puis affiche popup du bouton retour en avant (si didacticiel non fini)
    #
    def clickRetourArriere
        super
        if(@didactEnCours)
            @boutonAvant.set_sensitive(true)
            popup(@boutonAvant, Langue.text("didactAvant"), Gtk::PositionType::TOP)
            @boutonArriere.set_sensitive(false)
        end
    end

    ##
    # Fait un retour avant
    # puis update l'affichage de la grille
    # puis affiche popup du bouton check (si didacticiel non fini)
    #
    def clickRetourAvant
        super
        if(@didactEnCours)
            @boutonCheck.set_sensitive(true)
            popup(@boutonCheck, Langue.text("didactCheck"), Gtk::PositionType::TOP)
            @boutonAvant.set_sensitive(false)
        end
    end

    ##
    # Reinitialise la grille
    # puis update l'affichage de la grille
    # puis affiche popup du bouton demande d'indice (si didacticiel non fini)
    #
    def clickReinitialiserGrille
        super
        if(@didactEnCours)
            @boutonIndice.set_sensitive(true)
            popup(@boutonIndice, Langue.text("didactIndice"), Gtk::PositionType::TOP)
            @boutonReinitialiser.set_sensitive(false)
        end
    end

    ##
    # Surbrille les endroits ou il y a des erreurs
    # puis affiche popup du bouton réinitialiser (si didacticiel non fini)
    #
    def check
        super
        if(@didactEnCours)
            @boutonReinitialiser.set_sensitive(true)
            popup(@boutonReinitialiser, Langue.text("didactReinitialiser"), Gtk::PositionType::TOP)
            @boutonCheck.set_sensitive(false)
        end
    end

    ##
    # Regarde s'il y a des techniques
    # puis update l'affichage de la grille
    # puis affiche popup du bouton quitter, menu et pause
    #
    def appelResoudreGrille
        super
        if(@didactEnCours)
            popup(@boutonQuitter, Langue.text("didactQuitter"), Gtk::PositionType::LEFT)
            popup(@boutonMenu, Langue.text("didactMenu"), Gtk::PositionType::LEFT)
            @boutonPause.set_sensitive(true)
            popup(@boutonPause, Langue.text("didactPause"), Gtk::PositionType::LEFT)
            @boutonIndice.set_sensitive(false)
        end
    end

    ##
    # Affiche le menu pause et met en pause le jeu
    # puis affiche popup du bouton quitter, menu et pause
    #
    def modePause
        super
        if(@didactEnCours && @pause == true)
            @boutonReprendre.set_sensitive(true)
            popup(@boutonQuitterPause, Langue.text("didactQuitterPause"), Gtk::PositionType::LEFT)
            popup(@boutonMenuPause, Langue.text("didactMenuPause"), Gtk::PositionType::LEFT)
            popup(@boutonReprendre, Langue.text("didactReprendre"), Gtk::PositionType::LEFT)
        end
    end

    ##
    # Affiche un popup 
    #
    # === Attributes ===
    #
    # * -relative- Élément à laquelle le popup est rattaché
    # * -msg- Message du popup
    # * -position- Position du popup par rapport a relative (gauche, droite, haut, bas)
    #
    def popup(relative, msg, position)

        pop = Gtk::Popover.new()
        pop.set_relative_to(relative)
        pop.add(Gtk::Label.new(msg).show)
        pop.popup
        pop.set_position(position)

        if(relative == @grilleGUI)
            @boutonArriere.set_sensitive(true)
            relative.signal_connect("button-release-event"){
                if(@didactEnCours)
                    pop.set_relative_to(nil)
                    popup(@boutonArriere, Langue.text("didactArriere"), Gtk::PositionType::TOP)
                    relative.set_sensitive(false)
                end
            }
        else
            relative.signal_connect("clicked"){
                if(@didactEnCours)
                    pop.set_relative_to(nil)
                    relative.set_sensitive(false)
                end
            }
        end
        
        if(relative == @boutonReprendre)
            relative.signal_connect("clicked"){
                pop.set_relative_to(nil)
                relative.set_sensitive(false)
                @didactEnCours = false
                @grilleGUI.set_sensitive(true)
                @boutonMenu.set_sensitive(true)
                @boutonPause.set_sensitive(true)
                @boutonQuitter.set_sensitive(true)

                @boutonArriere.set_sensitive(true)
                @boutonAvant.set_sensitive(true)
                @boutonReinitialiser.set_sensitive(true)
                @boutonCheck.set_sensitive(true)
                @boutonIndice.set_sensitive(true)

                @boutonReprendre.set_sensitive(true)
                @boutonMenuPause.set_sensitive(true)
                @boutonQuitterPause.set_sensitive(true)
            }
        end
    end

end # Marqueur de fin de classe