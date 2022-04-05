require_relative './Technique.rb'
require_relative '../../Niveau/CaseCliquable.rb'
require_relative '../../Niveau/CaseChiffre.rb'

class SrndCompIsland < Technique

    public_class_method :new
     n = 0

    def initialize()
        
        super("Fermeture ile", "on ferme les iles quand elles sont finit")

    end

    def verifieTech(grille)

        file = Queue.new #File stock les cases du parcours
        atteignable = [] #Stock les cases atteignables de la grille

        grille.matrice.each do |line|
            line.each do |c|
 
                @casesChange = []

                if(c.is_a?(CaseChiffre) && c.chiffre > 1)
                    n = c.chiffre - 1
                    ca = c
                    count = 0;

                    while(count != n)
                    
                        #Case en haut 
                        if (grille.matrice[ca.y + 1][ca.x].is_a?(CaseCliquable) && grille.matrice[ca.y + 1][ca.x].etat == 1)
                            ca = grille.matrice[ca.y + 1][ca.x]
                            n+=1                                 
                        #Case à droite
                        elsif (grille.matrice[ca.y][ca.x + 1].is_a?(CaseCliquable) && grille.matrice[ca.y][ca.x + 1].etat == 1)
                            ca = grille.matrice[ca.y][ca.x + 1]
                            n+=1 
                        #Case en bas
                        elsif (grille.matrice[ca.y - 1][ca.x].is_a?(CaseCliquable) && grille.matrice[ca.y - 1][ca.x].etat == 1)
                            ca = grille.matrice[ca.y - 1][ca.x]
                            n+=1 
                        #Case à gauche
                        elsif (grille.matrice[ca.y][ca.x - 1].is_a?(CaseCliquable) && grille.matrice[ca.y][ca.x - 1].etat == 1)
                            ca = grille.matrice[ca.y][ca.x - 1]
                            n+=1 
                        end
                    end
                end

                #Verifie la case en haut 
                if(grille.matrice[c.y + 1][c.x].is_a?(CaseCliquable) && grille.matrice[c.y + 1][c.x].etat == 0)
                    @casesChange.push(grille.matrice[c.y + 1][c.x])
                end
                #Verifie la case à droite
                if(grille.matrice[c.y][c.x + 1].is_a?(CaseCliquable) && grille.matrice[c.y][c.x + 1].etat == 0)
                    @casesChange.push(grille.matrice[c.y][c.x + 1])
                end
                #Verifie la case en bas
                if(grille.matrice[c.y - 1][c.x].is_a?(CaseCliquable) && grille.matrice[c.y - 1][c.x].etat == 0)
                    @casesChange.push(grille.matrice[c.y - 1][c.x]) 
                end
                #Verifie la case à gauche
                if(grille.matrice[c.y][c.x - 1].is_a?(CaseCliquable) && grille.matrice[c.y][c.x - 1].etat == 0)
                    @casesChange.push(grille.matrice[c.y][c.x - 1]) 
                end

                return true if @casesChange.empty? == false

            end
        end

        return false
        
    end

end