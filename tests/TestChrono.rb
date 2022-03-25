##
# Test unitaire du chronomètre
#

load '../src/Niveau/Chronometre.rb'

#Création de 2 chronomètre
chrono1 = Chronometre.creerChrono()
chrono2 = Chronometre.creerChrono(20)

#lancement du premier chronomètre
chrono1.lancer

#update toutes les secondes
for x in (1..3)

    sleep(1)

    if(chrono1.timer == x && chrono2.timer == 20)
        puts("Test " + x.to_s + ": OK !")
    else
        puts("Test " + x.to_s + ": KO ! Chrono1: " + chrono1.timer.to_s + " Chrono2: " + chrono2.timer.to_s)
    end

end

#lancement du deuxieme chrono
chrono2.lancer

puts("\nAttente de 10 secondes...\n\n")
sleep(10)

if(chrono1.timer == 13 && chrono2.timer == 30)
    puts("Test 4: OK !")
else
    puts("Test 4: KO ! Chrono1: " + chrono1.timer.to_s + " Chrono2: " + chrono2.timer.to_s)
end

#arret du premier chrono
chrono1.on(false)

puts("\nAttente de 3 secondes...\n\n")
sleep(3)

if(chrono1.timer == 13 && chrono2.timer == 33)
    puts("Test 5: OK !")
else
    puts("Test 5: KO ! Chrono1: " + chrono1.timer.to_s + " Chrono2: " + chrono2.timer.to_s)
end