#!/usr/bin/env ruby

require_relative "./Bouton.rb"

require 'gtk3'

##
# Créer un bouton en fonction de son nom sa taille et la méthode qu'il va prendre une fois un clic réalisé
#

class BoutonSpecial < Bouton

    ##
    # @uneEtiquette, nom donné au bouton
    # @uneLongueur, longueur du bouton
    # @uneLargeur, largeur du bouton
    # @uneMethode, Méthode à lancer en fonction de l'action du bouton

    def BoutonSpecial.creer(uneEtiquette, uneLongueur, uneLargeur, uneMethode) 
        new(uneEtiquette, uneLongueur, uneLargeur, uneMethode)
    end

    def initialize(uneEtiquette, uneLongueur, uneLargeur, uneMethode)
        #Initialisation du bouton avec ses valeurs
        super(uneEtiquette, uneLongueur, uneLargeur)
        @methode = uneMethode

        self.signal_connect('clicked'){
            #Lancement de la méthode
            @methode.call
        }

    end

end
