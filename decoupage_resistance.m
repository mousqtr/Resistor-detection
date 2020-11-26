function Image_centree = decoupage_resistance(im)
    [h,w] = size(im);
    ligne_debut = floor(h/4);
    ligne_fin = floor(h - h/4);
    Image_centree = im(ligne_debut:ligne_fin,:,:);
end