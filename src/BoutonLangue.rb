#!/usr/bin/env ruby

require 'gtk3'

class BoutonLangue implements Bouton

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
    
    monBoutonLangue.add(box)
    monBoutonLangue.show_all
    
    #fenetre detruite = quitter
    monBoutonLangue.signal_connect('destroy') {onDestroy}

    Gtk.main


end