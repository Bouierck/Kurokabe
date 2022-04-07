#!/usr/bin/env ruby

require_relative "./Bouton.rb"

require 'gtk3'

##
# BoutonSpecial est une classe qui permet d'avoir un bouton et de lui associer une action tant que celle-ci passe par une méthode
class BoutonSpecial < Bouton

    ##
    # Constructeur
    # 
    # === Attributes
    #
    # * -uneEtiquette- étiquette du bouton
    # * -uneMethode- méthode à lancer lors du clic
    #
    def BoutonSpecial.creer(uneEtiquette, uneMethode)
        new(uneEtiquette, uneMethode)
    end

    def initialize(uneEtiquette, uneMethode)
        
        super(uneEtiquette)
        @methode = uneMethode

        self.signal_connect('clicked'){
            #Lancement de la méthode
            @methode.call
        }

    end

end
