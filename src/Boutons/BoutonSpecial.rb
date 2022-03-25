#!/usr/bin/env ruby

require 'gtk3'

class BoutonSpecial implements Bouton
    

    private_class_method :new

    def initialize(uneMethode)
        @methode = uneMethode
    end


    def methode()
        return @methode
    end

    def BoutonSpecial.creer()
        new()
    end

    def lanceMethode()

    end

    def onDestroy
        puts "Fin de l'appli"
        Gtk.main_quit
    end
    
    monBoutonSpecial = Gtk::Button.new
    
    #titre fenetre
    monBoutonSpecial.set_title("Bouton Special")
    
    #taille de la fenetre
    monBoutonSpecial.set_default_size(300,100)
    
    #bordure
    monBoutonSpecial.border_width = 5
    
    #redimensionnement
    monBoutonSpecial.set_resizable(true)
    
    #Création des boxs
    box = Gtk::Box.new(false,6)
    B2 = Gtk::ToggleButton.new('Special')
    box.pack_start(B2)
    B2.active = true
    box.pack_start(B2)
    
    monBoutonSpecial.add(box)
    monBoutonSpecial.show_all
    
    #fenetre detruite = quitter
    monBoutonSpecial.signal_connect('destroy') {onDestroy}
    Gtk.main


end