#!/usr/bin/env ruby

require 'gtk3'


class BoutonNiveau implements Bouton
    

    private_class_method :new

    def initialize(uneEtiquette)
        @etiquette = uneEtiquette
    end

    def BoutonNiveau.creer()
        new()
    end

    ddef afficheToi()
    window = Gtk::Window.new
    vbox = Gtk::VBox.new(true, 6)
    vbox.pack_start(Gtk::Button.new('Niveau 1'), false)
    vbox.pack_start(Gtk::Button.new('Niveau 2'), true, false)
    vbox.pack_start(Gtk::Button.new('Niveau 3'), true, true)

    window.add(vbox)
    window.show_all
    Gtk.main

    window.signal_connect('destroy') { 
        Gtk.main_quit 
    }
end 

end