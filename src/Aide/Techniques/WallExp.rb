require_relative './Technique.rb'
require_relative '../../Niveau/CaseCliquable.rb'

class WallExp < Technique

    public_class_method :new

    def initialize
        
        super(Langue.text("WallExp"), Langue.text("WallExpDesc"))

    end

    def verifieTech(grille)

        grille.matrice.each do |line|
            line.each do |c|

                @casesChange = []
                
                if(c.is_a?(CaseCliquable) && c.etat == TypeCase::MUR)
                    
                    ca = c

                    while(ca != nil)
                    
                        reliee = false
                        countPossible = 0


                        #On check si la case noir est toute seul
                        reliee = true if(isInGrid(grille.matrice, ca.x - 1, ca.y) && @casesChange.include?(grille.matrice[ca.y][ca.x - 1]) == false && grille.matrice[ca.y][ca.x - 1].is_a?(CaseCliquable) && grille.matrice[ca.y][ca.x - 1].etat == TypeCase::MUR)

                        reliee = true if(isInGrid(grille.matrice, ca.x, ca.y - 1) && @casesChange.include?(grille.matrice[ca.y - 1][ca.x]) == false && grille.matrice[ca.y - 1][ca.x].is_a?(CaseCliquable) && grille.matrice[ca.y - 1][ca.x].etat == TypeCase::MUR)

                        reliee = true if(isInGrid(grille.matrice, ca.x, ca.y + 1) && @casesChange.include?(grille.matrice[ca.y + 1][ca.x]) == false && grille.matrice[ca.y + 1][ca.x].is_a?(CaseCliquable) && grille.matrice[ca.y + 1][ca.x].etat == TypeCase::MUR)

                        reliee = true if(isInGrid(grille.matrice, ca.x + 1, ca.y) && @casesChange.include?(grille.matrice[ca.y][ca.x + 1]) == false && grille.matrice[ca.y][ca.x + 1].is_a?(CaseCliquable) && grille.matrice[ca.y][ca.x + 1].etat == TypeCase::MUR)

                        #Si elle est toute seul on regarde si elle n'a qu'ene seul possibilit√© de sortie
                        if(reliee == false)
                            
                            if(isInGrid(grille.matrice, ca.x - 1, ca.y) && @casesChange.include?(grille.matrice[ca.y][ca.x - 1]) == false && grille.matrice[ca.y][ca.x - 1].is_a?(CaseCliquable) && grille.matrice[ca.y][ca.x - 1].etat == TypeCase::VIDE)
                            
                                countPossible += 1
                                cs = grille.matrice[ca.y][ca.x - 1]

                            end

                            if(isInGrid(grille.matrice, ca.x, ca.y - 1) && @casesChange.include?(grille.matrice[ca.y - 1][ca.x]) == false && grille.matrice[ca.y - 1][ca.x].is_a?(CaseCliquable) && grille.matrice[ca.y - 1][ca.x].etat == TypeCase::VIDE)

                                countPossible += 1
                                cs = grille.matrice[ca.y - 1][ca.x]

                            end

                            if(isInGrid(grille.matrice, ca.x, ca.y + 1) && @casesChange.include?(grille.matrice[ca.y + 1][ca.x]) == false && grille.matrice[ca.y + 1][ca.x].is_a?(CaseCliquable) && grille.matrice[ca.y + 1][ca.x].etat == TypeCase::VIDE)

                                countPossible += 1
                                cs = grille.matrice[ca.y + 1][ca.x]

                            end

                            if(isInGrid(grille.matrice, ca.x + 1, ca.y) && @casesChange.include?(grille.matrice[ca.y][ca.x + 1]) == false && grille.matrice[ca.y][ca.x + 1].is_a?(CaseCliquable) && grille.matrice[ca.y][ca.x + 1].etat == TypeCase::VIDE)

                                countPossible += 1
                                cs = grille.matrice[ca.y][ca.x + 1]

                            end

                        end

                        if(countPossible == 1)
                            ca = cs
                            @casesChange << ca
                        else
                            ca = nil
                        end

                        puts(ca)

                    end

                end

                return true if @casesChange.empty? == false

            end

        end

        return false
        
    end

    def isInGrid(matrice, x, y)
        return x >= 0 && x < matrice.length && y >= 0 && y < matrice.length
    end

end