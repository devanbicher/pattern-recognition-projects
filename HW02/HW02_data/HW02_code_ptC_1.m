%Take in the data for the C's
cFile = fopen('HW02_data_c_NO_10.txt');
cCount = [];
disp('SHOWING C COUNTS...');
cCount = countXs_C(cFile);
disp('SHOWING C COUNT ARRAY:');
%disp(cCount);
fclose(cFile);

%Take in the data for the E's
disp('SHOWING E COUNTS...');
eFile = fopen('HW02_data_e_NO_10.txt');
eCount = [];
eCount = countXs_C(eFile);
disp('SHOWING E COUNT ARRAY:');
%disp(eCount);
fclose(eFile);

%find the smallest and largest number of pixels
small = min([min(cCount),min(eCount)]);
large = max([max(cCount),max(eCount)]);

disp(small);
disp(large);

%variables remembering the least number of errors, or miscalssifcations
bestThresh = small;
errors = 3600;
lowestCerror = 1800;
lowestEerror = 1800;

%Go through each number of pixels trying each one out as the threshold value
for t = small:large
   eError = 0;
   cError = 0;
    for i = 1:1800
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
disp(['There are ',num2str(lowestCerror), ' misclassified Cs, error rate: ',num2str(lowestCerror/3600)]);
disp(['There are ',num2str(lowestEerror), ' misclassified Es, error rate: ',num2str(lowestEerror/3600)]);