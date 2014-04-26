function [sparse_transition_matrix] = generate_M(sparse_transition_matrix)
%generate_M : generate the M matrix sparse transition matrix
% For each replace each Mij by Mij/n_i where n_i is the out degree of i.

for i = 1:size(sparse_transition_matrix,1)
    %i
   sparse_transition_matrix(i,:) = sparse_transition_matrix(i,:)/nnz(sparse_transition_matrix(i,:));    
end
end

