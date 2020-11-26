function image_bande = traitement_bandes(im)
    image_gray = rgb2gray(im);
    image_binarisee = imbinarize(image_gray,0.20);
    image_bande = image_binarisee;
    
end