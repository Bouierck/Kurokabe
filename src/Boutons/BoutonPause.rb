#!/usr/bin/env ruby

require_relative "./BoutonMenu.rb"

require 'gtk3'

##
# Lance le menu pause et stop le chronometre du niveau
#
class BoutonPause < BoutonMenu

    ##
    #@niveau niveau mis en pause

    private_class_method :new

    def BoutonPause.creer(uneEtiquette, uneLongueur, uneLargeur, unMenu, unNiveau)
        new(uneEtiquette, uneLongueur, uneLargeur, unMenu, unNiveau)
    end

    def initialize(uneEtiquette, uneLongueur, uneLargeur, unMenu, unNiveau)
        super(uneEtiquette, uneLongueur, uneLargeur, unMenu)
        @niveau = unNiveau

        self.signal_connect('clicked'){
            @menu.lancerMenu
            @niveau.chrono.on(false)
        }
    end

    
end
