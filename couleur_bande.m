function couleur = couleur_bande(image_bande)

    image = im2double(imread(image_bande));

    %% On recupère les valeur moyennes de HSV de l'image
    [H,S,V] = image2hsv(image);

    %% construction du cube HSV
    [cube_hsv,coord_couleurs] = construction_cube_hsv();
    
    %% amelioration du cube HSV
    cube_hsv_ameliore = optimisation_cube_hsv(cube_hsv,coord_couleurs);

    %% recuperation de la couleur
    num_couleur = cube_hsv_ameliore(H,S,V);
    couleurs = {'noir','rouge','orange','doree','jaune','vert','bleu','violet','blanc'};
    couleur = couleurs{num_couleur + 1};
    
end