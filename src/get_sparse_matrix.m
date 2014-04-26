function [sparse_transition_matrix] = get_sparse_matrix(path)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%sparse_transition_matrix= [];

% Keep a hashMap to count number of elements for each entry.
C=sparse(100000,100000);

%walk through matrix once and count the number of lines.
fid = fopen(path);
tline = fgets(fid);
max=0; % Maximum number of rows.
while ischar(tline)
    %disp(tline);
    tline = fgets(fid);        
    if isempty(tline) || strncmp(tline,'%',1) || ~ischar(tline)        
        continue
    end
    comp = strsplit(tline);    
    no = str2num(comp{1});
    C(no,1)=C(no,1)+1;   
        
    %countMap(no)
        
    
    %disp('comp');
   % comp
    %comp{1}
    %comp{2}
    %comp{3}
    if no>max
        max=no;
    end    
end

%countMap
fclose(fid);

disp(max)
disp('processing insertion into sparse matrix')
% Pass to 2 
sparse_transition_matrix =sparse(max,max);
fid = fopen(path);

tline = fgets(fid);
while ischar(tline)
    %disp(tline);
    tline = fgets(fid);    
    if isempty(tline) || strncmp(tline,'%',1) || ~ischar(tline)
        continue
    end
    comp = strsplit(tline);
    i = str2num(comp{1});
    j = str2num(comp{2});
    %k = str2num(comp{3});
    %countMap(i)
    sum = C(i,1);
    sparse_transition_matrix(i,j) = 1/sum;
end

fclose(fid);
sparse_transition_matrix
end

