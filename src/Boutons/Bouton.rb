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

    def Bouton.creer()
        new()
    end

    def onDestroy
        puts "Fin de l'appli"
        Gtk.main_quit
    end
    

    monBouton = Gtk::Button.new
    
    #titre fenetre
    monBouton.set_title("Bouton")
    
    #taille de la fenetre
    monBouton.set_default_size(300,100)
    
    #bordure
    monBouton.border_width = 5
    
    #redimensionnement
    monBouton.set_resizable(true)
    
    #Création des boxs
    box = Gtk::Box.new(false,6)

    

    B1 = Gtk::ToggleButton.new('Bouton')
    box.pack_start(B1)
    B1.active = true
    box.pack_start(B1)
    

    monBouton.add(box)



    monBouton.show_all
    
    #fenetre detruite = quitter
    monBouton.signal_connect('destroy') {onDestroy}
    Gtk.main


end
