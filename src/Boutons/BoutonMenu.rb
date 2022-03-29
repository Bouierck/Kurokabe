#!/usr/bin/env ruby

require_relative "./Bouton.rb"

require 'gtk3'

##
# Boutons présents sur la fenêtre du menu principal
#

class BoutonMenu < Bouton
    
    ##
    # @uneEtiquette, nom donné au bouton
    # @uneLongueur, longueur du bouton
    # @uneLargeur, largeur du bouton
    # @unMenu, menu à lancer
    #

    def BoutonMenu.creer(uneEtiquette, uneLongueur, uneLargeur, unMenu)
        new(uneEtiquette, uneLongueur, uneLargeur, unMenu)
    end

    private_class_method :new

    def initialize(uneEtiquette, uneLongueur, uneLargeur, unMenu)
        #Initialisation du bouton avec ses valeurs
        super(uneEtiquette, uneLongueur, uneLargeur)
        @menu = unMenu

        
        self.signal_connect('clicked'){
            #Lance le menu
            @menu.lancerMenu
        }

    end
end

   
