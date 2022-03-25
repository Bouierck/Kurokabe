#!/usr/bin/env ruby

require_relative "./Bouton.rb"

require 'gtk3'

##
# Lance un menu
#
class BoutonMenu < Bouton
    
    ##
    #@menu Menu à lancé à l'appuie du bouton

    def BoutonMenu.creer(uneEtiquette, uneLongueur, uneLargeur, unMenu)
        new(uneEtiquette, uneLongueur, uneLargeur, unMenu)
    end

    private_class_method :new

    def initialize(uneEtiquette, uneLongueur, uneLargeur, unMenu)

        super(uneEtiquette, uneLongueur, uneLargeur)
        @menu = unMenu

    end

    self.signal_connect('clicked'){
        @menu.lancerMenu
    }

end