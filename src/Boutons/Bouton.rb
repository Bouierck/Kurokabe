#!/usr/bin/env ruby

require 'gtk3' 

##
# Représente un bouton (Classe abstraite)
#

class Bouton < Gtk::Button

    ##
    # @uneEtiquette, nom donné au bouton
    # @uneLongueur, longueur du bouton
    # @uneLargeur, largeur du bouton
    #

    attr_reader :longueur, :largeur

    private_class_method :new

	def initialize(uneEtiquette, uneLongueur, uneLargeur)
        #Initialisation du bouton avec ses valeurs
        super(uneEtiquette)

        @longueur = uneLongueur
        @largeur = uneLargeur

    end
    
end