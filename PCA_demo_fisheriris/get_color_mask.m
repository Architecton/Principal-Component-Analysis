function [M] = get_color_mask(Cats)
  M = zeros(size(Cats));
  color = 0;
  M(1) = color;
  for i = 2:size(Cats)(1)
    if !strcmp(Cats(i), Cats(i - 1))
      color += 10;
    end
    M(i) = color;
  end
end
      
      