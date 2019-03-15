function total = countXs_C(myFile)
    total = [];
    for i = 1:1800
		line = fgetl(myFile);
		text = textscan(line, '%s %s %s %s');

		% Get the height of each image
		height = strrep(text{2}, 'h', '');
		height = str2num(height{1});

		% Get the width of each image
		width = strrep(text{3}, 'w', '');
		width = str2num(width{1});

		xCount = 0;
        top = 0;
        
		% Count all of the X's in each image
		for n = 1:height
			line = fgetl(myFile);
			for x = 1:width
				if line(x:x) == 'x'
					xCount = xCount + 1;
                    if n >= 1 && n <= 12
                        top = top + 1;
                    end
				end
			end
        end
        
        bottom = xCount - top;
        
		topHeavy = floor(((100.0*top)/bottom)+.5);
        
		total = [total, topHeavy];

    end
	
end