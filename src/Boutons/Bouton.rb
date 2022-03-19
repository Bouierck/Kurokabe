#!/usr/bin/env ruby



require 'gtk3' 


class Bouton
    private_class_method :new

	def initialize(uneEtiquette, uneLongueur, uneLargeur, positionX, positionY)
        @etiquette = uneEtiquette
        @longueur = uneLongueur
        @largeur = uneLargeur
        @x = positionX
        @y = positionY
        
    end

    def etiquette()
        return @etiquette
    end

    def longueur()
        return @longueur
    end

    def largeur()
        return @largeur
    end

    def x()
        return @x 
    end

    def y()
        return @y 
    end

    def Bouton.creer(uneEtiquette, uneLongueur, uneLargeur, positionX, positionY)
        new(uneEtiquette, uneLongueur, uneLargeur, positionX, positionY)
    end

    def afficheBouton()
        button = Gtk::Button.new(etiquette)
        Gtk.main
    end 
end
