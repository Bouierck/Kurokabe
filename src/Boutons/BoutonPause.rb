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

    ##
    # Constructeur
    #
    # === Attributes
    #
    # * -uneEtiquette- étiquette du bouton
    # * -unNiveau- niveau dans lequel se lance la pause
    def BoutonPause.creer(uneEtiquette, unNiveau)
        new(uneEtiquette, unNiveau)
    end

    def initialize(uneEtiquette, unNiveau)
        super(uneEtiquette)
        @niveau = unNiveau

        self.signal_connect('clicked'){
            @niveau.modePause
        }
    end

    
end
