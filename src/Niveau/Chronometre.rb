class Chronometre

    ##
    # @timer => temps en seconde depuis le début de la grille
    # @dateDebut => date de lancement de la grille
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
        @timer = temps
    end

    ##
    # Lancer le timer du chrono
    #
    def lancer

        @dateDebut = Time.new()  
        @estLance = true

    end

    ##
    # Arreter le timer du chrono
    #
    def stop
        @estLance = false
    end

    ##
    # Update le timer 
    #
    # @returns La nouvel valeur du timer
    #
    def update

        if(@estLance)
            @timer += Time.new().sec - @dateDebut.sec
            @dateDebut = Time.new()
        end

        return @timer

    end

end