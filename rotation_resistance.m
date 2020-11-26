function J = rotation_resistance(im)

% %% Chargement de l'image
% im = im2double(imread('photos/res5.jpg'));
im_echantillonee = im(1:5:end, 1:5:end, :);

%% Suppression des reflets
im_tophat = im_echantillonee - imtophat(im_echantillonee, ones(5));
% imshow(im_tophat, [])

%% Niveaux de gris
im_gray = rgb2gray(im_tophat);
grad = imdilate(im_gray, ones(3)) - imerode(im_gray, ones(3));

%% Application de la transformee de Hough
grad_BW = imbinarize(grad, .2*max(grad(:)));
grad_BW = imdilate(grad_BW, ones(7));

[H,theta,rho] = hough(grad_BW);

seuil = 0.7 * max(H(:));
H = H > seuil;


%% Calcul de langle pour la rotation
[l,c]=find(H);
angle_mean = mean(abs(cos(theta(c) * pi / 180)));
angle = acos(angle_mean)*180 / pi;
J = imrotate(im,90-angle);




end