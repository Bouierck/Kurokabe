require 'gtk3'

require_relative '../Boutons/BoutonRetour.rb'

require_relative './MenuClassement.rb'



class ClassementNiveau < Gtk::Box

    attr_reader:titlebar

    def initialize(app,datas)

        path_to_profile = "./profile/"


        super(:vertical, 10)

        s = datas.to_s.split("")

        topLabel = Gtk::Label.new.tap{ |label|
            label.set_markup("Classement du niveau : " + s[0] + "." + s[1])
            label.show 
        }

        classmLabel = Gtk::Label.new.tap{ |label|
            label.set_markup("")
            label.show 
        }

        self.pack_start(topLabel)
        self.pack_start(classmLabel)


        users = Dir.entries(path_to_profile).select { |f| 
            if(f!="." && f!="..") then 
                f 
            end}

        @totals = ""
        sortedUser = Hash.new

        users.each { |x| 
            str = path_to_profile + x + "/infosScore.krkb"
            file = File.open(str)
            file_data = file.read.split(" ")

            datasSplitted = datas.to_s.split("")

            scoreUser = ""
            y = 0
            if(datasSplitted[0] == "1") then #cas nivFacile
                scoreUser = file_data[datas+19] #11 - 15 == 31 - 35
            end
            if(datasSplitted[0] == "2") then #cas nivMoyen
                scoreUser = file_data[datas+14] # 21 - 25 == 36 - 40
            end

            if(datasSplitted[0] == "3") then #cas nivDifficile
                scoreUser = file_data[datas+9] # 31 - 35 == 41 - 45
            end 
            
            if(scoreUser != "0")then
                sortedUser[x] = scoreUser.to_i
            end

        }

        sortedTable = sortedUser.sort_by {|k,v| v}.reverse

        sortedTable.each{ |k,v|
            @totals += k + " : " + v.to_s + "\n"
    }
        classmLabel.set_markup(@totals)
        

        self.show
        
        @titlebar = Gtk::HeaderBar.new.tap { |barre|
            barre.title = "Kurokabe"
            barre.show_close_button = true
            barre.pack_start(BoutonRetour.creer(MenuClassement.method(:new), app))
            barre.show
        }

    end


end