#!/usr/bin/env ruby

require 'gtk3'

class BoutonNiveau
    private_class_method : new

    def initialize(UnNiveau)
        @niveau = UnNiveau
    end

    def niveau()
        return @niveau
    end

    def BoutonNiveau.creer()
        new()
    end

    def lanceNiveau()

    end

    def onDestroy
        puts "Fin de l'appli"
        Gtk.main_quit
    end
    
    monBoutonNiveau = Gtk::Button.new
    
    #titre fenetre
    monBoutonNiveau.set_title("Bouton Niveau")
    
    #taille de la fenetre
    monBoutonNiveau.set_default_size(300,100)
    
    #bordure
    monBoutonNiveau.border_width = 5
    
    #redimensionnement
    monBoutonNiveau.set_resizable(true)
    
    #Création des boxs
    box = Gtk::Box.new(false,6)
    B4 = Gtk::ToggleButton.new('Niveau')
    box.pack_start(B4)
    B4.active = true
    box.pack_start(B4)
    
    monBoutonNiveau.add(box)
    monBoutonNiveau.show_all
    
    #fenetre detruite = quitter
    monBoutonNiveau.signal_connect('destroy') {onDestroy}
    Gtk.main

end