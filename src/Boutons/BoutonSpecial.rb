#!/usr/bin/env ruby

require_relative "./Bouton.rb"

require 'gtk3'

class BoutonSpecial < Bouton

    def BoutonLangue.creer(uneEtiquette, uneLongueur, uneLargeur, uneMethode)
        new(uneEtiquette, uneLongueur, uneLargeur, uneMethode)
    end

    def initialize(uneEtiquette, uneLongueur, uneLargeur, uneMethode)
        
        super(uneEtiquette, uneLongueur, uneLargeur)
        @methode = uneMethode

    end

    self.signal_connect('clicked'){
        #Lancement de la méthode
    }

end