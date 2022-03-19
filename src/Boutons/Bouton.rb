#!/usr/bin/env ruby

require 'gtk3' 

##
# Représente un bouton (Classe abstraite)
#
class Bouton < Gtk::Button

    ##
    # @longueur longueur du bouton
    # @largeur largeur du bouton

    attr_reader :longueur :largeur

    private_class_method :new

	def initialize(uneEtiquette, uneLongueur, uneLargeur)
        
        super(etiquette)

        @longueur = uneLongueur
        @largeur = uneLargeur

    end
    
end
