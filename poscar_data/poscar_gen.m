clear all
close all

function rng(x)
  randn("seed",x)
  rand("seed",x)
end

% rng('default');
rng(1000);

Hmat = [ 9.72667803928967 0 0; 0 8.4235502764570693 0; 0 0 45.0];
pos0 = load('poscar.txt');
num_atoms = length(pos0(:, 1));
num_Mn = [5 10 15 20 25];

max_files=10000;

count=1;
for mn = 1:length(num_Mn)
 for i = 1:max_files
   i1 = randperm(num_atoms);
   p1 = pos0(i1,:);
  
   fp = fopen(sprintf('data/POSCAR_%08d.txt', count), 'w');
   fprintf(fp, 'FeMn_%d_%d\n', num_atoms, num_Mn(mn));
   fprintf(fp, '1.00\n');
   for j = 1:3
     for k = 1:3
       fprintf(fp, '%f ', Hmat(j, k));
     end
     fprintf(fp, '\n');
   end
   fprintf(fp, 'Fe Mn\n'); 
   fprintf(fp,'  %d %d\n', num_atoms-num_Mn(mn), num_Mn(mn)); 
   fprintf(fp,'Direct\n');
   for j = 1:num_atoms
     fprintf(fp, '%f %f %f\n', p1(j, 1), p1(j, 2), p1(j, 3));
   end
   count = count + 1;
   fclose(fp); 
 end
end
