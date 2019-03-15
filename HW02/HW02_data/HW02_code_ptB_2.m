%Take in the data for the C's
cFile = fopen('HW02_data_c_TEST.txt');
cCount = [];
disp('SHOWING C COUNTS...');
cCount = countXs_B(cFile);
disp('SHOWING C COUNT ARRAY:');
%disp(cCount);
fclose(cFile);

%Take in the data for the E's
disp('SHOWING E COUNTS...');
eFile = fopen('HW02_data_e_TEST.txt');
eCount = [];
eCount = countXs_B(eFile);
disp('SHOWING E COUNT ARRAY:');
%disp(eCount);
fclose(eFile);

t = 229;
cError = 0;
eError = 0;

for i = 1:1000
    %if a value in the list of C pixels is greater than t it was misclassified
   if cCount(i) >= t
       cError = cError + 1;
   end

   if eCount(i) < t
        eError = eError + 1;
   end
end
    
disp(['There are ',num2str(cError), ' misclassified Cs']);
disp(['There are ',num2str(eError), ' misclassified Es']);