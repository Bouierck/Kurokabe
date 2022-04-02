##
# Un observable notifie tous ses obervateurs lorsque cela est nécéssaire
# Il peut donc ajouté des observateurs
#
# Un observable doit initialisé une variable d'instance @observateurs = []
#
module Observable

    ##
    # Ajoute un observeur à la case
    #
    def ajouteObservateur(observateur)
        @observateurs << observateur
    end

    ##
    # Notifie tu les observeurs
    #
    def notifObservateurs
        @observateurs.each do |observateur|
            observateur.update
        end
    end

end