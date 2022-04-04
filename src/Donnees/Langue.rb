class Langue

    ##
    # @@listeners => Observateurs
    # @@trad => Hash des différents textes

    @@listeners = []

    private_class_method :new

    ##
    # Initialise la langue en français
    #
    def self.init
        self.changerLangue(0)
    end

    ##
    # Change la langue de l'application
    #
    # === Attributes
    #
    # * -langue- langue de l'app (0 français, 1 anglais)
    #
    def self.changerLangue(langue)
        
        if(langue == 0)
            file = File.open(__dir__ + "/../../assets/langues/french.txt")
        else
            file = File.open(__dir__ + "/../../assets/langues/english.txt")
        end
        
        arr = []

        file.read.split("\n").each{ |line|
            arr << line.split(": ")
        }

        arr.each { |text|
            text[1].gsub!(/RTAL/, "\n")
        }

        trad = arr.to_h

        file.close()
    
        @@trad = trad
        self.update

    end

    ##
    # Récupération du text qui correspond à la clé
    #
    def self.text(key)
        return @@trad[key]
    end

    ##
    # Ajoute un observateur
    # les observateurs sont des objets pouvant changé leur label
    #
    # === Atrributes
    #
    # * -listener- Observateur
    # * -text- text à associer à l'observateur lorsque l'on change de langue
    #
    def self.addListener(listener, text)
        @@listeners << [listener, text]
    end

    private

    ##
    # Met à jour les observateurs
    #
    def Langue.update

        @@listeners.each do |l|
            l[0].label = Langue.text(l[1])
        end

        return 
    end


end