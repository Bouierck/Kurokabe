require 'gtk3'

class Chronometre < Gtk::Label

    ##
    # @timer => temps en seconde depuis le début de la grille
    # @estLance => vrai si le chrono est lancé faux sinon

    attr_reader :timer

    ##
    # Constructeur de chronometre 
    #
    # === Attributes ===
    #
    # * -temps- temps avec lequel le chrono va démarer
    def Chronometre.creerChrono(temps = 0)
        new(temps)
    end

    private_class_method :new

    def initialize(temps)
        super(temps.to_s)
        @timer = temps
        @estLance = false
    end

    ##
    #Creer un thread qui update le timer
    #
    def lancer

        @estLance = true

        Thread.new do
            while(@estLance)
                update
                sleep(1)
            end
        end

    end

    ##
    # Arreter ou lance le timer du chrono
    # 
    # === Attributes ===
    #
    # * -bool- true pour lancer le chrono false pour l'arreter
    #
    def on(bool = true)

        @estLance = bool

    end

    ##
    # Update le timer et l'affichage
    #
    def update

        @timer += 1
        self.label = self.to_s
        return self

    end

    ##
    # Format des secondes en minutes:secondes
    #
    def to_s

        min = @timer / 60
        sec = @timer % 60

        return "#{min}:#{sec}"

    end

end