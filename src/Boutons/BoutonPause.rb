#!/usr/bin/env ruby

require_relative "./Bouton.rb"

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
    end

    self.signal_connect('clicked'){
        super()
        #Arret chrono dans le niveau
    }

end