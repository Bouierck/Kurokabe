require_relative './Technique.rb'
require_relative '../../Niveau/CaseChiffre.rb'
require_relative '../../Niveau/CaseCliquable.rb'

class UnreachSqr < Technique

    public_class_method :new

    def initialize
        
        super("Case inatteignable", "")
 
    end

    def verifieTech(grille)

        file = Queue.new #File stock les cases du parcours
        atteignable = [] #Stock les cases atteignables de la grille

        grille.matrice.each do |line|
            line.each do |c|

                @casesChange = []

                if(c.is_a?(CaseChiffre))
                    
                    n = c.chiffre - 1
                    file << [c, n]
                    
                    while((prof = file.pop)[1] > 0)

                        ca = prof[0]
                        ns = prof[1] - 1

                        if(ca.x > 0 && grille.matrice[ca.y][ca.x - 1].is_a?(CaseCliquable) && grille.matrice[ca.y][ca.x - 1].etat != 2)

                            if(atteignable.include?(grille.matrice[ca.y][ca.x - 1]) == false)
                                file << [grille.matrice[ca.y][ca.x - 1], ns]
                                atteignable << grille.matrice[ca.y][ca.x - 1]
                            end

                        end
                        if(ca.y > 0 && grille.matrice[ca.y - 1][ca.x].is_a?(CaseCliquable) && grille.matrice[ca.y - 1][ca.x].etat != 2)

                            if(atteignable.include?(grille.matrice[ca.y - 1][ca.x]) == false)
                                file << [grille.matrice[ca.y - 1][ca.x], ns]
                                atteignable << grille.matrice[ca.y - 1][ca.x]
                            end

                        end
                        if(ca.x < (grille.matrice.length - 1)  && grille.matrice[ca.y][ca.x + 1].is_a?(CaseCliquable) && grille.matrice[ca.y][ca.x + 1].etat != 2)

                            if(atteignable.include?(grille.matrice[ca.y][ca.x + 1]) == false)
                                file << [grille.matrice[ca.y][ca.x + 1], ns]
                                atteignable << grille.matrice[ca.y][ca.x + 1]
                            end

                        end
                        if(ca.y < (line.length - 1) && grille.matrice[ca.y + 1][ca.x].is_a?(CaseCliquable) && grille.matrice[ca.y + 1][ca.x].etat != 2)                            

                            if(atteignable.include?(grille.matrice[ca.y + 1][ca.x]) == false)
                                file << [grille.matrice[ca.y + 1][ca.x], ns]
                                atteignable << grille.matrice[ca.y + 1][ca.x]
                            end

                        end

                    end

                    file.clear()

                end

            end
        end

        @casesChange = grille.matrice.flatten.reduce([]) { |nonAtteignable, c|
            nonAtteignable << c if atteignable.include?(c) == false && c.is_a?(CaseCliquable) && c.etat != 2
            nonAtteignable
        }

        return true if @casesChange.empty? == false
        return false

    end

end