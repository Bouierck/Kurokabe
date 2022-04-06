##
# Chronomètre donne le temps depuis que le niveau a commencé a être résolue
#
class Chronometre

    ##
    # @timer => temps en seconde depuis le début de la grille
    # @estLance => vrai si le chrono est lancé faux sinon

    attr_reader :timer
    attr_writer :grilleFini

    ##
    # Constructeur de chronometre 
    #
    # === Attributes ===
    #
    # * -temps- temps avec lequel le chrono va démarer
    #
    def Chronometre.creerChrono(temps = 0)
        new(temps)
    end

    private_class_method :new

    def initialize(temps)

        @timer = temps
        @estLance = false
        @grilleFini = false

    end
 
    ##
    # Arrete ou lance le timer du chrono
    # 
    # ==== Attributes
    #
    # * -bool- true pour lancer le chrono false pour l'arreter
    #
    def on(bool = true)

        @estLance = bool
        return self

    end

    ##
    # Update le timer et l'affichage
    #
    def update

        @timer += 1
        return self

    end


    ##
    # Format des secondes en minutes:secondes
    #
    def to_s

        min = @timer / 60
        sec = @timer % 60

        s = "#{min}:#{sec}" 
        s += " ✔" if @grilleFini

        return s

    end

    ##
    # Vrai si le timer est lancé faux sinon
    #
    def estLance?
        return @estLance
    end

end