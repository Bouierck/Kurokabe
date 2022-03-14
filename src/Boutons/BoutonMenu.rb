#!/usr/bin/env ruby

require 'gtk3'
require_relative "Kurob/src/Menus/Menu.rb"
Gtk.init

class BoutonMenu
    private_class_method :new


    def initialize(uneEtiquette)
        @etiquette = uneEtiquette
    end

    def BoutonMenu.creer(uneEtiquette)
        new(uneEtiquette)
    end

    def afficheToi()
        window = Gtk::Window.new
        vbox = Gtk::VBox.new(true, 6)
        vbox.pack_start(Gtk::Button.new('Bouton Menu 1'), false)
        vbox.pack_start(Gtk::Button.new('Bouton Menu 2'), true, false)
        vbox.pack_start(Gtk::Button.new('Bouton Menu 3'), true, true)

        window.add(vbox)
        window.show_all
        Gtk.main

        window.signal_connect('destroy') { 
            Gtk.main_quit 
        }
    end 
end