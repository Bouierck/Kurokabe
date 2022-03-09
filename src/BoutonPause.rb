#!/usr/bin/env ruby

require 'gtk3'

class BoutonPause implements Bouton
    
    private_class_method :new

    def initialize(unePause)
        @pause = unePause
    end

    def pause()
        return @pause
    end

    def BoutonPause.creer()
        new()
    end

    def onDestroy
        puts "Fin de l'appli"
        Gtk.main_quit
    end
    
    monBoutonPause = Gtk::Button.new
    
    #titre fenetre
    monBoutonPause.set_title("Bouton Pause")
    
    #taille de la fenetre
    monBoutonPause.set_default_size(300,100)
    
    #bordure
    monBoutonPause.border_width = 5
    
    #redimensionnement
    monBoutonPause.set_resizable(true)
    
    #Création des boxs
    box = Gtk::Box.new(false,6)
    B6 = Gtk::ToggleButton.new('Pause')
    box.pack_start(B6)
    B6.active = true
    box.pack_start(B6)
    
    monBoutonPause.add(box)
    monBoutonPause.show_all
    
    #fenetre detruite = quitter
    monBoutonPause.signal_connect('destroy') {onDestroy}
    Gtk.main

end