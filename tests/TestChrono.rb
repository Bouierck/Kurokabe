##
# Test unitaire du chronomètre
#

load '../src/Niveau/Chronometre.rb'

#Création de 2 chronomètre
chrono1 = Chronometre.creerChrono()
chrono2 = Chronometre.creerChrono(20)

#lancement des chronomètre
chrono1.lancer
chrono2.lancer

#update toutes les secondes
for x in (1..3)

    sleep(1)

    if(chrono1.update == x && chrono2.update == 20 + x)
        puts("Test " + x.to_s + ": OK !")
    else
        puts("Test " + x.to_s + ": KO !")
    end

end

#stop du deuxieme chrono
chrono2.stop

puts("\nAttente de 10 secondes...\n\n")
sleep(10)

if(chrono1.update == 13 && chrono2.update == 23)
    puts("Test 4: OK !")
else
    puts("Test 4: KO !")
end