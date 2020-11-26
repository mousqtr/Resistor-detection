function [val,tolerance] = calcul_resistance(couleurs_relevees)

    %% paramètres initiaux
    couleurs_possibles = ["noir","marron","rouge","orange","jaune","vert","bleu","violet","gris","blanc"];
    multiplicateur_possible = ["gris","doree","noir","marron","rouge","orange","jaune","vert","bleu"];
    tolerance_possible = ["violet","bleu","vert","marron","rouge","doree","argent"];
    valeurs_tolerance = [0.1,0.25,0.5,1,2,5,10];
    liste_valeurs = zeros(3);
    tolerance = 0;
    
    %% calcul des deux premieres valeurs
    for k = 1:2
        for p = 1:length(couleurs_possibles)
            if couleurs_relevees(k) == couleurs_possibles(p)
                liste_valeurs(k) = p-1;
            end
        end
    end
    %% calcul du coefficient multiplicateur
    for p = 1:length(multiplicateur_possible)
        if couleurs_relevees(3) == multiplicateur_possible(p)
            liste_valeurs(3) = 10^(p-3);
        end
    end
    %% calcul de la tolerance
    for p = 1:length(tolerance_possible)
        if couleurs_relevees(4) == tolerance_possible(p)
            tolerance = valeurs_tolerance(p);
        end
    end
    
    %% calcul valeur totale
    val = (liste_valeurs(1)*10 + liste_valeurs(2))*liste_valeurs(3);
    
end