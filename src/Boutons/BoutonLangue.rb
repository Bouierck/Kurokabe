#!/usr/bin/env ruby

require_relative "./Bouton.rb"

require 'gtk3'

##
# Chaange la langue de l'application
#
class BoutonLangue < Bouton

    def BoutonLangue.creer(uneEtiquette, uneLongueur, uneLargeur, uneLangue)
        new(uneEtiquette, uneLongueur, uneLargeur, uneLangue)
    end

    def initialize(uneEtiquette, uneLongueur, uneLargeur, uneLangue)
        
        super(uneEtiquette, uneLongueur, uneLargeur)
        @langue = uneLangue

    end

    self.signal_connect('clicked'){
        #Changement de la langue
    }

end