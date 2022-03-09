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
    
    monApp = Gtk::Window.new
    monBouton = Gtk::Button.new
    
    #titre fenetre
    monApp.set_title("Bouton")
    
    #taille de la fenetre
    monApp.set_default_size(300,100)
    
    #bordure
    monApp.border_width = 5
    
    #redimensionnement
    monApp.set_resizable(true)

    # L'application est toujours centrée
    monApp.set_window_position(Gtk::WindowPosition::CENTER_ALWAYS)
    
    #Création des boxs
    maBox = Gtk::Box.new(:horizontal,6)
    B1 = Gtk::ToggleButton.new('Bouton')
    box.pack_start(B1)
    B1.active = true
    box.pack_start(B1)
    
    monApp.add(box)
    monBouton.show_all
    
    #fenetre detruite = quitter
    monBouton.signal_connect('destroy') {onDestroy}
    Gtk.main


end
