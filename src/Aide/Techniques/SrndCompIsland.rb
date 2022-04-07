require_relative './Technique.rb'
require_relative '../../Niveau/CaseCliquable.rb'
require_relative '../../Niveau/CaseChiffre.rb'

##
# Technique qui consiste à entourer un ilot completé avec des cases noires
class SrndCompIsland < Technique

    public_class_method :new

    def initialize
        super("Surrounding a completed island", "")
    end

    def verifieTech(grille)

        
        file = Queue.new #File stock les cases du parcours
        @casesChange = []
        
        grille.matrice.each do |line|
            line.each do |c|
                
                cases = []       #Cases reiées

                #!! Si la case est un 1 tech Islande aura déjà été appelé !!

                if(c.is_a?(CaseChiffre) && c.chiffre > 1)

                    file << c
                    cases << c

                    while(file.empty? == false)

                        ca = file.pop #case actuelle

                        if(ca.x > 0 && grille.matrice[ca.y][ca.x - 1].is_a?(CaseCliquable) && grille.matrice[ca.y][ca.x - 1].etat == TypeCase::POINT && cases.include?(grille.matrice[ca.y][ca.x - 1]) == false)

                            file << grille.matrice[ca.y][ca.x - 1]
                            cases << grille.matrice[ca.y][ca.x - 1]

                        end
                        if(ca.y > 0 && grille.matrice[ca.y - 1][ca.x].is_a?(CaseCliquable) && grille.matrice[ca.y - 1][ca.x].etat == TypeCase::POINT && cases.include?(grille.matrice[ca.y - 1][ca.x]) == false)

                            file << grille.matrice[ca.y - 1][ca.x]
                            cases << grille.matrice[ca.y - 1][ca.x]

                        end
                        if(ca.x < grille.matrice.length - 1 && grille.matrice[ca.y][ca.x + 1].is_a?(CaseCliquable) && grille.matrice[ca.y][ca.x + 1].etat == TypeCase::POINT && cases.include?(grille.matrice[ca.y][ca.x + 1]) == false)

                            file << grille.matrice[ca.y][ca.x + 1]
                            cases << grille.matrice[ca.y][ca.x + 1]

                        end
                        if(ca.y < grille.matrice.length - 1 && grille.matrice[ca.y + 1][ca.x].is_a?(CaseCliquable) && grille.matrice[ca.y + 1][ca.x].etat == TypeCase::POINT && cases.include?(grille.matrice[ca.y + 1][ca.x]) == false)

                            file << grille.matrice[ca.y + 1][ca.x]
                            cases << grille.matrice[ca.y + 1][ca.x]

                        end

                    end

                    if(cases.length == c.chiffre)

                        cases.each { |ca|

                            @casesChange << grille.matrice[ca.y][ca.x - 1] if ca.x > 0 && grille.matrice[ca.y][ca.x - 1].is_a?(CaseCliquable) && grille.matrice[ca.y][ca.x - 1].etat == TypeCase::VIDE
                            @casesChange << grille.matrice[ca.y][ca.x + 1] if ca.x < (grille.matrice.length - 1) && grille.matrice[ca.y][ca.x + 1].is_a?(CaseCliquable) && grille.matrice[ca.y][ca.x + 1].etat == TypeCase::VIDE
                            @casesChange << grille.matrice[ca.y - 1][ca.x] if ca.y > 0 && grille.matrice[ca.y - 1][ca.x].is_a?(CaseCliquable) && grille.matrice[ca.y - 1][ca.x].etat == TypeCase::VIDE
                            @casesChange << grille.matrice[ca.y + 1][ca.x] if ca.y < (grille.matrice.length - 1) && grille.matrice[ca.y + 1][ca.x].is_a?(CaseCliquable) && grille.matrice[ca.y + 1][ca.x].etat == TypeCase::VIDE

                        }
                        
                        return true if @casesChange.empty? == false

                    end

                end

            end
        end

        return false
        
    end

end