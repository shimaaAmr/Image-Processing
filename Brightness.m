function brightedimage = Brightness(oldimage, offset)
[oldrows,oldcols,c] = size(oldimage);
brightedimage = zeros(oldrows,oldcols,c,'uint8');

for z = 1 : c
    for i = 1 : oldrows
        for j = 1 : oldcols
            brightedimage(i,j,z) = oldimage(i,j,z) + offset;
            if(brightedimage(i,j,z) < 0)
                brightedimage(i,j,z) = 0;
            elseif(brightedimage(i,j,z)>255)
                brightedimage(i,j,z) = 255;
            end
        end
    end
end
figure,imshow(brightedimage);
end