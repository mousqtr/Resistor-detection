function [H,S,V] = image2hsv(image)
    [h,w,z] = size(image); 
    image_hsv = rgb2hsv(image);
    
    H_moy = [];
    S_moy = [];
    V_moy = [];
    for i = 1:h
        for j = 1:w
            H_moy=[H_moy,image_hsv(i,j,1)];
            S_moy=[S_moy,image_hsv(i,j,2)];
            V_moy=[V_moy,image_hsv(i,j,3)];
        end
    end
    hue = mean(H_moy);
    saturation = mean(S_moy);
    value = mean(V_moy);

    H = floor(hue*360+1);
    S = floor(saturation*100+1);
    V = floor(value*100+1);
end
