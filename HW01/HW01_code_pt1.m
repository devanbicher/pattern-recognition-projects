%Take in the data for the C's
cFile = fopen('HW1_c.txt');
cCount = [];
disp('SHOWING C COUNTS...');
cCount = countXs(cFile);
disp('SHOWING C COUNT ARRAY:');
disp(cCount);
fclose(cFile);

%Take in the data for the E's
disp('SHOWING E COUNTS...');
eFile = fopen('HW1_e.txt');
eCount = [];
eCount = countXs(eFile);
disp('SHOWING E COUNT ARRAY:');
disp(eCount);
fclose(eFile);

%find the smallest and largest number of pixels
small = min([min(cCount),min(eCount)]);
large = max([max(cCount),max(eCount)]);

disp(small);
disp(large);

%variables remembering the least number of errors, or miscalssifcations
bestThresh = small;
errors = 200;
lowestCerror = 100;
lowestEerror = 100;

%Go through each number of pixels trying each one out as the threshold value
for t = small:large
   eError = 0;
   cError = 0;
    for i = 1:100
		%if a value in the list of C pixels is greater than t it was misclassified
       if cCount(i) >= t
           cError = cError + 1;
       end
       
       if eCount(i) < t
            eError = eError + 1;
       end
    end
	
	%check the number of errors at each threshold
	if (cError + eError) < errors
		bestThresh = t;
		errors = cError + eError;
		lowestCerror = cError;
		lowestEerror = eError;
	end
end

disp(['The best threshold is: ',num2str(bestThresh)]);
disp(['There are ',num2str(lowestCerror), ' misclassified Cs']);
disp(['There are ',num2str(lowestEerror), ' misclassified Es']);