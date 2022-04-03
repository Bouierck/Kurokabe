class Score

    private_class_method :new

    ##
    # Renvoie le nombre d'étoiles obtenue en fonction de la difficulté
    #
    def Score.calculer(nbTechnique, timer, difficulte)

        score = (10000/(nbTechnique + 1) - timer * 2)/difficulte
        return 3 if(score > 2000)
        return 2 if(score > 850)
        return 1

    end

end 