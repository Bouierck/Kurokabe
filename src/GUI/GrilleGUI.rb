require_relative '../Niveau/Grille.rb'
require_relative  '../Niveau/CaseCliquable.rb'

require_relative './CaseChiffreGUI.rb'
require_relative './CaseCliquableGUI.rb'

require 'gtk3'

##
# Représente l'aspect graphique d'une grille
#
class GrilleGUI < Gtk::Grid

    ##
    # @grille => grille reprséenté par ce GUI
    # @matriceGUI => matrice contenant les boutons de la grille

    attr_reader :grille, :matriceGUI

    ##
    # Constructeur
    #
    # === Attributes
    #
    # * -grille- grille représentée par le gui
    #
    def GrilleGUI.creer(grille)
        new(grille)
    end

    private_class_method :new

    def initialize(grille)

        super()
        @grille = grille
        @matriceGUI = @grille.matrice.map(&:clone)
        initMatriceGui

    end

    ##
    # Initialise la matrice de CaseGUI a partir de la grille
    #
    def initMatriceGui

        @nbCase = @matriceGUI.length * @matriceGUI.length

        @matriceGUI.each do |line|
            line.each do |c|

                if(c.is_a?(CaseCliquable))
                    @matriceGUI[c.y][c.x] = CaseCliquableGUI.creer(c, @grille, @nbCase)
                else
                    @matriceGUI[c.y][c.x] = CaseChiffreGUI.creer(c)
                end

                self.attach(@matriceGUI[c.y][c.x], c.x*2, c.y*2, 2, 2)

            end
        end

    end

    ##
    # Met à jour les cases de la grille
    #
    def updateGrille

        @matriceGUI.each do |line|
            line.each do |c|
                c.updateCaseGUI if(c.is_a?(CaseCliquableGUI))
            end
        end

        @grille.update

    end

end