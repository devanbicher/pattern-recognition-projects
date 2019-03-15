%Take in the data for the C's
cFile = fopen('HW02_data_c_10.txt');
cCount = [];
disp('SHOWING C COUNTS...');
cCount = countXs_A(cFile);
disp('SHOWING C COUNT ARRAY:');
%disp(cCount);
fclose(cFile);

%Take in the data for the E's
disp('SHOWING E COUNTS...');
eFile = fopen('HW02_data_e_10.txt');
eCount = [];
eCount = countXs_A(eFile);
disp('SHOWING E COUNT ARRAY:');
%disp(eCount);
fclose(eFile);

t = 223;
cError = 0;
eError = 0;

for i = 1:200
    %if a value in the list of C pixels is greater than t it was misclassified
   if cCount(i) >= t
       cError = cError + 1;
   end

   if eCount(i) < t
        eError = eError + 1;
   end
end
    
disp(['Error rate is ',num2str(cError/400), ' misclassified Cs']);
disp(['Error rate is ',num2str(eError/400), ' misclassified Es']);