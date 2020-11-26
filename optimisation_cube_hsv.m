function cube_hsv_ameliore = optimisation_cube_hsv(cube_hsv,coord_couleurs)
    
    %% couleurs permettant d'améliorer la précision de notre cube hsv
    image1 = im2double(imread('cube_hsv/1.jpg'));
    image2 = im2double(imread('cube_hsv/2.jpg'));
    image3 = im2double(imread('cube_hsv/3.jpg'));       
    image4 = im2double(imread('cube_hsv/4.jpg'));
    image5 = im2double(imread('cube_hsv/5.jpg'));
    image7 = im2double(imread('cube_hsv/7.jpg'));       
    image8 = im2double(imread('cube_hsv/8.jpg'));
    image9 = im2double(imread('cube_hsv/9.jpg'));
    image10 = im2double(imread('cube_hsv/10.jpg'));
    image11 = im2double(imread('cube_hsv/11.jpg'));       
    image12 = im2double(imread('cube_hsv/12.jpg'));
    image13 = im2double(imread('cube_hsv/13.jpg'));
    image15 = im2double(imread('cube_hsv/15.jpg'));
    image18 = im2double(imread('cube_hsv/18.jpg'));
    image20 = im2double(imread('cube_hsv/20.jpg'));       

    images = {image1,image2,image3,image4,image5,image7,image8,image9,image10,image11,image12,image13,image15,image18,image20};
    couleurs_obtenues = {9,9,9,9,9,9,9,9,9,9,9,9,9,9,9};
    couleurs_a_obtenir = {8,7,6,6,6,1,4,1,0,5,5,7,6,5,4};

    %% On recupere les coordonnées de chaque couleur
    rouge_1 = coord_couleurs{1};
    orange = coord_couleurs{2};
    doree = coord_couleurs{3};
    jaune = coord_couleurs{4};
    vert = coord_couleurs{5};
    bleu = coord_couleurs{6};
    violet = coord_couleurs{7};
    rouge_2 = coord_couleurs{8};
    noir = coord_couleurs{9};
    blanc_v = coord_couleurs{10};
    blanc_s = coord_couleurs{11};
    
    %% on modifie cube_hsv avec les valeurs HSV relevees qui different
    for k = 1:15
        [H,S,V] = image2hsv(images{k});
        couleurs_obtenues{k} = cube_hsv(H,S,V);

        if couleurs_obtenues{k}~=couleurs_a_obtenir{k}
%             disp(k);
            switch couleurs_a_obtenir{k}
                case 0
                    if V > noir{2}
                        noir{2} = V;       
                    end   
                    cube_hsv(:,:,noir{1}:noir{2}) = 0; 

                case 1
                    if H > rouge_1{2}
                        rouge_1{2} = H;
                    end
                    if H < rouge_2{2}
                        rouge_2{2} = H;
                    end
                    cube_hsv(rouge_1{1}:rouge_1{2},:,:) = 1;
                    cube_hsv(rouge_2{1}:rouge_2{2},:,:) = 1;  

                case 2
                    if H > orange{2}
                        orange{2} = H;
                    end
                    if H < orange{1}
                        orange{1} = H;
                    end
                    cube_hsv(orange{1}:orange{2},:,:) = 2;    

                case 3
                    if H > doree{2}
                        doree{2} = H;
                    end
                    if H < doree{1}
                        doree{1} = H;
                    end
                    cube_hsv(doree{1}:doree{2},:,:) = 3;    

                case 4
                    if H > jaune{2}
                        jaune{2} = H;
                    end
                    if H < jaune{1}
                        jaune{1} = H;
                    end
                    cube_hsv(jaune{1}:jaune{2},:,:) = 4;  

                case 5
                    if H > vert{2}
                        vert{2} = H;
                    end
                    if H < vert{1}
                        vert{1} = H;
                    end
                    cube_hsv(vert{1}:vert{2},:,:) = 5;   

                case 6
                    if H > bleu{2}
                        bleu{2} = H;
                    end
                    if H < bleu{1}
                        bleu{1} = H;
                    end
                    cube_hsv(bleu{1}:bleu{2},:,:) = 6; 

                case 7
                    if H > violet{2}
                        violet{2} = H;
                    end
                    if H < violet{1}
                        violet{1} = H;
                    end
                    cube_hsv(violet{1}:violet{2},:,:) = 7;   

                case 8
                    if S > blanc_s{2}
                        blanc_s{2} = S;
                    end
                    if V < blanc_v{1}
                        blanc_v{1} = V;
                    end
                    cube_hsv(:,blanc_s{1}:blanc_s{2},blanc_v{1}:blanc_v{2}) = 8;

            end

        end

    end

    cube_hsv_ameliore = cube_hsv;
%     disp('---- erreur ----');
%     for k = 1:15
%         [H,S,V] = image2hsv(images{k});
%         couleurs_obtenues{k} = cube_hsv(H,S,V);
% 
%         if couleurs_obtenues{k}~=couleurs_a_obtenir{k}
%             disp(k);
%         end
% 
%     end

end


