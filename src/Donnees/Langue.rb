class Langue

    @@listeners = []
    
    def self.init
        self.changerLangue(0)
    end

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

    def self.text(key)
        return @@trad[key]
    end

    def self.addListener(listener, text)
        @@listeners << [listener, text]
    end

    private
    def Langue.update

        @@listeners.each do |l|
            l[0].label = Langue.text(l[1])
        end

        return 
    end


end