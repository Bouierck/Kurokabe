#!/usr/bin/env ruby

require_relative "./BoutonMenu.rb"

require 'gtk3'

##
# Lance le menu pause et stop le chronometre du niveau
#
class BoutonPause < Bouton

    ##
    #@niveau niveau mis en pause

    private_class_method :new

    def BoutonPause.creer(uneEtiquette, uneLongueur, uneLargeur, unNiveau)
        new(uneEtiquette, uneLongueur, uneLargeur, unNiveau)
    end

    def initialize(uneEtiquette, uneLongueur, uneLargeur, unNiveau)
        super(uneEtiquette, uneLongueur, uneLargeur)
        @niveau = unNiveau

        self.signal_connect('clicked'){
            @niveau.modePause

        }
    end

    
end
