%% initialisation
clear all; close all;

image1 = im2double(imread('photos/resistance_8.jpg'));
image2 = im2double(imread('photos/image8.jpg'));
image3 = im2double(imread('photos/resistance_4.jpg'));
image4 = im2double(imread('photos/image9.jpg'));
images = {image1,image2,image3,image4};


%% redimensionnement de la photo
images_resize = {image1,image2,image3,image4};
figure(1)
for k = 1:4
    images_resize{k} = imresize(images{k},[1000 1000]);
    subplot(2,2,k)
    imshow(images_resize{k},[])
end

%% rotation de la resistance
images_retournees = {image1,image2,image3,image4};
figure(2)
for k = 1:4
    images_retournees{k} = rotation_resistance(images_resize{k});
    subplot(2,2,k)
    imshow(images_retournees{k},[])
end

%% segmentation des resistances
images_segmentees = {image1,image2,image3,image4};
figure(3)
for k = 1:4
    images_segmentees{k} = segmentation_resistance(images_retournees{k});
    subplot(2,2,k)
    imshow(images_segmentees{k},[])
end

%% Decoupage du de la zone centrale de la resistance
images_rognees = {image1,image2,image3,image4};
figure(4)
for k = 1:4
    images_rognees{k} = decoupage_resistance(images_segmentees{k});
    subplot(2,2,k)
    imshow(images_rognees{k},[])
end

%% traitement des bandes
% bandes_traitees = {image1,image2,image3,image4};
% figure(5)
% for k = 1:4
%     bandes_traitees{k} = traitement_bandes(images_rognees{k});
%     subplot(2,2,k)
%     imshow(bandes_traitees{k},[])
% end

%% calcul de valeur de la resistance

couleurs_relevees = ["rouge","marron","rouge","doree"];
[valeur,tolerance] = calcul_resistance(couleurs_relevees);
disp(valeur)
disp(tolerance)
