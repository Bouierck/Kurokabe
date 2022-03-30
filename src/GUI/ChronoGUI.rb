require_relative '../Niveau/Chronometre.rb'

require 'gtk3'

##
# Chronomètre donne le temps depuis que le niveau a commencé a être résolue
#
class ChronoGUI < Gtk::Label

    ##
    # @chrono

    def ChronoGUI.creer(chrono)
        new(chrono)
    end

    private_class_method :new

    def initialize(chrono)
        super(chrono.to_s)
        @chrono = chrono
    end

    ##
    #Creer un thread qui update le timer
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