function [r_k] = compute_page_rank_vector(transition_matrix,alpha)
% compute_page_rank_vector- Computes the page rank vecotor for all
% documents in the corpora
%  M - transition matrix where each M_ij = 1/n_i where n_i = outDegree of
%  i.
%  alpha - weighting parameter.
%  Iterative update r_k = B_k * r_0
% 

% generate the transition matrix.
disp('computing M matrix')
%M = generate_M(transition_matrix);
M=transition_matrix;
n = size(M,1);


p_0=1/n*ones(n,1);

% compute B matrix.

disp('computing B initiaMl matrix')

%B=((1-alpha)*M + (alpha*E))';
r_0 = rand(n,1);
%curProd = B*r;

disp('Beginning power Iteration');

%Until convergence
i=1;
r_k_1 = r_0;
while(i<500)      
     i
     r_k = ((1-alpha)*M'*r_k_1) + alpha*p_0;     
     r_k_1 = r_k;
     r_k(1:10)
     i=i+1
end

%r_k=r_k/sum(r_k);

end

