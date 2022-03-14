#!/usr/bin/env ruby

require 'gtk3'

class BoutonLangue

    private_class_method :new

    def initialize(uneEtiquette)
        @etiquette = uneEtiquette
    end

    def BoutonLangue.creer(uneEtiquette)
        new(uneEtiquette)
    end

    def afficheToi()
        window = Gtk::Window.new
        vbox = Gtk::VBox.new(true, 6)
        vbox.pack_start(Gtk::Button.new('Français'), false)
        vbox.pack_start(Gtk::Button.new('English'), true, false)

        window.add(vbox)
        window.show_all
        Gtk.main

        window.signal_connect('destroy') { 
            Gtk.main_quit 
        }
    end 
end