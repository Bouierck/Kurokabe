#!/usr/bin/env ruby

require 'gtk3'

class BoutonSpecial
    

    private_class_method :new

    def initialize(uneEtiquette)
        @etiquette = uneEtiquette
    end


    def BoutonSpecial.creer(uneEtiquette)
        new(uneEtiquette)
    end

    def afficheToi()
        window = Gtk::Window.new
        vbox = Gtk::VBox.new(true, 6)
        vbox.pack_start(Gtk::Button.new('Bouton Special 1'), false)
        vbox.pack_start(Gtk::Button.new('Bouton Special 2'), true, false)
        vbox.pack_start(Gtk::Button.new('Bouton Special 3'), true, true)

        window.add(vbox)
        window.show_all
        Gtk.main

        window.signal_connect('destroy') { 
            Gtk.main_quit 
        }
    end 
end