require_relative '../src/Aide/Techniques/SrndCompIsland.rb'
require_relative '../src/Niveau/Niveau.rb'
require_relative '../src/Donnees/Utilisateur.rb'

niveau = Niveau.creer(1, Utilisateur.creer("Stun", 0), "Classique")
puts niveau.grille

srdSqr = SrndCompIsland.new()

#Ile complétement vide
if(srdSqr.verifieTech(niveau.grille) == true)
    puts("Test 1: KO !")
else
    puts("Test 1: OK !")
end


if(srdSqr.verifieTech(niveau.grille) == true)
    puts("Test 2: OK !")
else
    puts("Test 2: KO !")
end