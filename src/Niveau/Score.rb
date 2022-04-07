class Score

    private_class_method :new

    ##
    # Renvoie le nombre d'étoiles obtenue en fonction de la difficulté
    #
    def Score.calculer(nbTechnique, timer, difficulte)

        nb = 1

        case difficulte
            when 1
                nb += 1 if timer <= 300
                nb += 1 if nbTechnique <= 10
            when 2
                nb += 1 if timer <= 450
                nb += 1 if nbTechnique <= 5
            when 3
                nb += 1 if timer <= 600
                nb += 1 if nbTechnique <= 1
        end

        return nb

    end

end 