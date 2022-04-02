require_relative '../Niveau/Chronometre.rb'

require 'gtk3'

##
# Représente l'aspect graphique du chronomètre
# c'est lui qui lance le chrono
#
class ChronoGUI < Gtk::Label

    ##
    # @chrono => chrono représenté par ce gui

    ##
    # Constructeur
    #
    # === Attributes
    #
    # * -chrono- chrono représenté par ce gui
    #
    def ChronoGUI.creer(chrono)
        new(chrono)
    end

    private_class_method :new

    def initialize(chrono)
        super(chrono.to_s)
        @chrono = chrono
    end

    ##
    # Lance le chrono
    # creer un thread qui update le timer
    #
    def lancer

        @chrono.on

        Thread.new do
            while(@chrono.estLance?)
                update
                sleep(1)
            end
        end

        return self

    end

    ##
    # Met en pause le chrono
    #
    def stop
        chrono.on(false)
    end

    ##
    # Update le timer et l'affichage
    #
    def update

        @chrono.update
        self.label = @chrono.to_s
        return self

    end

end