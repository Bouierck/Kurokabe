#!/usr/bin/env ruby

require 'gtk3'

class BoutonLangue
    private_class_method :new

    def initialize(uneLangue)
        @langue = uneLangue
    end

    def langue()
        return @langue
    end

    def BoutonLangue.creer()
        new()
    end

    def changeLangue()

    end

    def onDestroy
        puts "Fin de l'appli"
        Gtk.main_quit
    end
    
    monBoutonLangue = Gtk::Button.new
    
    #titre fenetre
    monBoutonLangue.set_title("Bouton Langue")
    
    #taille de la fenetre
    monBoutonLangue.set_default_size(300,100)
    
    #bordure
    monBoutonLangue.border_width = 5
    
    #redimensionnement
    monBoutonLangue.set_resizable(true)
    
    #Création des boxs
    box = Gtk::Box.new(false,6)
    B3 = Gtk::ToggleButton.new('Langue')
    box.pack_start(B3)
    B3.active = true
    box.pack_start(B3)
    
    monBoutonLangue.add(box)
    monBoutonLangue.show_all
    
    #fenetre detruite = quitter
    monBoutonLangue.signal_connect('destroy') {onDestroy}
    Gtk.main


end