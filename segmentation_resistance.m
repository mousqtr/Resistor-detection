function image_segmentee = segmentation_resistance(image_retournee)

    %conversion en nuances de gris
    image_gray = rgb2gray(image_retournee);
    [h,w] = size(image_gray);

    %gradient de la photo
    nhood = ones(10);
    Idilat = imdilate(image_gray,nhood);
    Ierod = imerode(image_gray,nhood);
    gradI = Idilat-Ierod;
    gradI = imbinarize(gradI,0.2);
    
    %supression du gradient correspondant aux bordures
    bordures = ones(h,w);
    for i = 1:h
        for j = 1:w
            if image_gray(i,j) == 0
                bordures(i,j) = 0;
            end
        end
    end
    nhood2 = ones(50);
    bordures = imerode(bordures,nhood2);
    gradI = gradI.*bordures;
    
    %fermeture et erosion de la resistance
    nhood3 = ones(100);
    Iclose = imclose(gradI,nhood3);
    nhood4 = ones(20);
    Iclose = imerode(Iclose,nhood4);
    
    %recherche de la l'épaisseur la plus large
    max = 0;
    for j=1:w
        somme_colonne = sum(Iclose(:,j));
        if somme_colonne > max
            max = somme_colonne;
        end        
    end

    %suppression des epaisseur trop faible
    colonne_nulle = zeros(h,1);
    for j=1:w
        somme_colonne = sum(Iclose(:,j));
        if somme_colonne < floor(0.7*max)
            Iclose(:,j) = colonne_nulle;
        end        
    end

    %calcul des coordonnées de segmentation
    x_min = w; x_max = 1;
    y_min = h; y_max = 1;

    for i=1:h
        %calcul de x_min
        for j=1:w
            if Iclose(i,j) == 1
                if j < x_min
                    x_min = j;
                end
            end
        end
        %calcul de x_max
        for j=w:-1:1
            if Iclose(i,j) == 1
                if j > x_max
                    x_max = j;
                end
            end
        end
    end

    for j=1:w
        %calcul de y_min
        for i=1:h
            if Iclose(i,j) == 1
                if i < y_min
                    y_min = i;
                end
            end
        end   
        %calcul de y
        for i=h:-1:1
            if Iclose(i,j) == 1
                if i > y_max
                    y_max = i;
                end
            end
        end
    end
    
    image_segmentee = image_retournee(y_min:y_max,x_min:x_max,:);
    
end