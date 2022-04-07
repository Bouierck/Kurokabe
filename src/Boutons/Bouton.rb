#!/usr/bin/env ruby

require 'gtk3' 

##
# Représente un bouton (Classe abstraite)
#
class Bouton < Gtk::Button

    private_class_method :new

	def initialize(uneEtiquette)
        
        super(uneEtiquette)
        self.show

    end
    
end