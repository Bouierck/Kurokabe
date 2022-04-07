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
    # * -uneLongueur- longueur du bouton
    # * -uneLargeur- largeur du bouton
    # * -unNiveau- niveau dans lequel se lance la pause
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
