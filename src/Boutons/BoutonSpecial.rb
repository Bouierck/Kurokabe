#!/usr/bin/env ruby

require_relative "./Bouton.rb"

require 'gtk3'

class BoutonSpecial < Bouton

    ##
    # Constructeur
    # 
    # === Attributes
    #
    # * -uneEtiquette- étiquette du bouton
    # * -uneLongueur- longueur du bouton
    # * -uneLargeur- largeur du bouton
    # * -uneMethode- méthode à lancer lors du clic
    #
    def BoutonSpecial.creer(uneEtiquette, uneLongueur, uneLargeur, uneMethode)
        new(uneEtiquette, uneLongueur, uneLargeur, uneMethode)
    end

    def initialize(uneEtiquette, uneLongueur, uneLargeur, uneMethode)
        
        super(uneEtiquette, uneLongueur, uneLargeur)
        @methode = uneMethode

        self.signal_connect('clicked'){
            #Lancement de la méthode
            @methode.call
        }

    end

end
