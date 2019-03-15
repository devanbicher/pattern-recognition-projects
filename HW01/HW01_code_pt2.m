function total = countXs(myFile)
    total = [];
    for i = 1:100
		line = fgetl(myFile);
		text = textscan(line, '%s %s %s %s');

		% Get the height of each image
		height = strrep(text{2}, 'h', '');
		height = str2num(height{1});

		% Get the width of each image
		width = strrep(text{3}, 'w', '');
		width = str2num(width{1});

		xCount = 0;
		% Count all of the X's in each image
		for n = 1:height
			line = fgetl(myFile);
			for x = 1:width
				if line(x:x) == 'x'
					xCount = xCount + 1;
				end
			end
		end
		disp(xCount);
		total = [total, xCount];

    end
	
	disp('Histogram for number of Xs');
	hist(total,100);
end