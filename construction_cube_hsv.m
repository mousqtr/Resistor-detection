function [cube_hsv,coord_couleurs] = construction_cube_hsv()
    
    %% cube contenant les coordonnées des couleurs HSV
    cube_hsv = zeros(361,101,101);

    rouge_1 = {1,15};
    orange = {16,30};
    doree = {30,59};
    jaune = {60,91};
    vert = {92,160};
    bleu = {161,250};
    violet = {251,340};
    rouge_2 = {341,361};
    noir = {1,20};
    blanc_v = {90,101};
    blanc_s = {1,10};

    coord_couleurs = {rouge_1,orange,doree,jaune,vert,bleu,violet,rouge_2,noir,blanc_v,blanc_s};
    
    cube_hsv(rouge_1{1}:rouge_1{2},:,:) = 1;            
    cube_hsv(orange{1}:orange{2},:,:) = 2;          
    cube_hsv(doree{1}:doree{2},:,:) = 3;           
    cube_hsv(jaune{1}:jaune{2},:,:) = 4;           
    cube_hsv(vert{1}:vert{2},:,:) = 5;             
    cube_hsv(bleu{1}:bleu{2},:,:) = 6;                
    cube_hsv(violet{1}:violet{2},:,:) = 7;          
    cube_hsv(rouge_2{1}:rouge_2{2},:,:) = 1;  
    cube_hsv(:,:,noir{1}:noir{2}) = 0;     
    cube_hsv(:,blanc_s{1}:blanc_s{2},blanc_v{1}:blanc_v{2}) = 8;
    
end