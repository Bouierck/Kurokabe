#!/usr/bin/env ruby

require 'gtk3'

class BoutonMenu
    private_class_method : new

    def initialize(UnMenu)
        @menu = UnMenu
    end

    def menu()
        return @menu
    end

    def BoutonMenu.creer()
        new()
    end

    def lanceMenu()

    end

    def onDestroy
        puts "Fin de l'appli"
        Gtk.main_quit
    end
    
    monBoutonMenu = Gtk::Button.new
    
    #titre fenetre
    monBoutonMenu.set_title("Bouton Menu")
    
    #taille de la fenetre
    monBoutonMenu.set_default_size(300,100)
    
    #bordure
    monBoutonMenu.border_width = 5
    
    #redimensionnement
    monBoutonMenu.set_resizable(true)
    
    #Création des boxs
    box = Gtk::Box.new(false,6)
    B5 = Gtk::ToggleButton.new('Menu')
    box.pack_start(B5)
    B5.active = true
    box.pack_start(B5)
    
    monBoutonMenu.add(box)
    monBoutonMenu.show_all
    
    #fenetre detruite = quitter
    monBoutonMenu.signal_connect('destroy') {onDestroy}
    Gtk.main


end