require 'gtk3'

require_relative '../Boutons/BoutonRetour.rb'

require_relative './MenuClassement.rb'


##
# Menu regroupant les informations de classement sur les niveau classés
#
class ClassementNiveau < Gtk::Box

    ##
    # @titlebar => barre de titre de la fenêtre

    attr_reader:titlebar

    def initialize(app,datas)

        #Récupère le chemin des profils de joueurs
        path_to_profile = __dir__ + "/../../profile/"

        super(:vertical, 10)

        
        self.halign = Gtk::Align::CENTER

        app.fenetre.resize(700,700)




        s = datas.to_s.split("")

        #Affiche le label avec le numéro du niveau sélectionné
        topLabel = Gtk::Label.new.tap{ |label|
            label.set_markup("Classement du niveau : " + s[0] + "." + s[1])
            label.style_context.add_class("titre1")
            label.show 
        }

        classmLabel = Gtk::Label.new.tap{ |label|
            label.set_markup("")
            label.show 
        }

        self.pack_start(topLabel)
        self.pack_start(classmLabel)


        users = Dir.entries(path_to_profile).select { |f| 
            if(f.start_with?(".") == false) then 
                f 
            end
        }

        totals = ""
        sortedUser = Hash.new

        #Récupère le fichier infosScore.krkb de chaque profil
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

        #Tri les joueurs en fonction de leur temps effectué
        sortedTable = sortedUser.sort_by {|k,v| v}

        i = 0
        sortedTable.each{ |k,v|
            min = v / 60
            sec = v % 60
            i+=1

            #Prépare l'affiche sous forme de "Classement - NomJoueur : Temps"
            totals += i.to_s + " -  " + k + " : " + "#{min}:#{sec}" + "\n"
        }
        
        classmLabel.set_markup(totals)
        classmLabel.style_context.add_class("margin-top")
        classmLabel.style_context.add_class("titre3")
        
        self.show


        #Bouton retour de la barre de la fenêtre
        @titlebar = Gtk::HeaderBar.new.tap { |barre|
            barre.title = "Kurokabe"
            barre.show_close_button = true
            barre.pack_start(BoutonRetour.creer(MenuClassement.method(:new), app))
            barre.show
        }

    end


end