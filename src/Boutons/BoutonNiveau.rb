#!/usr/bin/env ruby

require_relative "./Bouton.rb"

require 'gtk3'

##
# Lance un niveau
#
class BoutonNiveau < Bouton

    ##
    #@niveau Niveaau qui se lance au clque sur le bouton

    def BoutonNiveau.creer(uneEtiquette, uneLongueur, uneLargeur, unNiveau)
        new(uneEtiquette, uneLongueur, uneLargeur, unMenu)
    end

    private_class_method :new

    def initialize(uneEtiquette, uneLongueur, uneLargeur, unMenu)
        super(uneEtiquette, uneLongueur, uneLargeur)
        @niveau = unNiveau
    end

    self.signal_connect('clicked'){
        @niveau.lanceToi
    }

end