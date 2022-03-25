class Score

    def Score.creer(score)
        new(score)
    end

    private_class_method :new

    def initialize(score)
        @scoreCumul = score
    end

    def ajouteScore(score)
        @scoreCumul += score
    end
end