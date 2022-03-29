#!/usr/bin/env ruby

require_relative "./BoutonMenu.rb"

require 'gtk3'

##
# Lance le menu pause et stop le chronometre du niveau 
#
class BoutonPause < BoutonMenu

    private_class_method :new

    ##
    # @uneEtiquette, nom donné au bouton
    # @uneLongueur, longueur du bouton
    # @uneLargeur, largeur du bouton
    # @unMenu, Lance le menu Pause une fois le bouton utilisé
    # @unNiveau, Va permettre d'arreter le chrono du niveau et de le redémarrer

    def BoutonPause.creer(uneEtiquette, uneLongueur, uneLargeur, unMenu, unNiveau)
        new(uneEtiquette, uneLongueur, uneLargeur, unMenu, unNiveau)
    end

    def initialize(uneEtiquette, uneLongueur, uneLargeur, unMenu, unNiveau)
        #Initialisation du bouton avec ses valeurs
        super(uneEtiquette, uneLongueur, uneLargeur, unMenu)
        @niveau = unNiveau

        self.signal_connect('clicked'){
            #Lancement du Menu
            @menu.lancerMenu
            #Arret du chrono
            @niveau.chrono.on(false)
        }
    end

    
end
