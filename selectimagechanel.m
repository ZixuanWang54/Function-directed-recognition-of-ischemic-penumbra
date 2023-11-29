function [image_trim] = selectimagechanel(image,chanel_number )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
[~,c]=size(image);
 switch chanel_number
    case 1
       if rem(c,2)==1
        image_trim=image(:,[chanel_number:2:c]);
       else
        image_trim=image(:,[chanel_number:2:c-1]);
       end
    case 2
        if rem(c,2)==1
        image_trim=image(:,[chanel_number:2:c-1]);
        else
        image_trim=image(:,[chanel_number:2:c]);
        end
  end
end

