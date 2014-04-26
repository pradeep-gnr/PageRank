function [R_T] = get_topic_page_rank_matrix(M,alpha,beta,gamma,doc_topic_file,n,T)
%This function performs computes T, the topic specific page rank matrix.
%each column in the page rank matrix is a the page rank vector for each

%read through the document and initialize the topic-document matrix.
% M -- the link matrix.
% n -- number of documents in the corpus
% t - number of topics in the corpus.
% M- path = 0 if we need to recompute M, or else load M from the path.
topic_doc_count_matrix = zeros(T,n);
fid = fopen(doc_topic_file);
tline = fgets(fid);

% read each line from the file and update the count.

disp('Reading Topic Document file');

while ischar(tline)
    %disp(tline);
    tline = fgets(fid);        
    if isempty(tline) || strncmp(tline,'%',1) || ~ischar(tline)        
        continue
    end
    comp = strsplit(tline);    
    di = str2num(comp{1}); % the current document.
    ti = str2num(comp{2}); % the current topic.
    %disp([di,ti]);
    
    topic_doc_count_matrix(ti,di) = 1;
end

fclose(fid);
% for each topic compute  r_t, the page rank vector for topic t.


disp('going to compute topic specific page rank');
R_T = []; % the final page rank matrix of all topics.
p_0=1/n*ones(n,1);
t=1;
while(t<=T)
    
    % For each topic i.
    
    t
    n_t = nnz(topic_doc_count_matrix(t,:)) % number of documents for a topic t    
    p_t = topic_doc_count_matrix(t,:); % the 
    p_t = topic_doc_count_matrix(t,:)/n_t;
    p_t=p_t';
    
    r_0 = rand(n,1); % Random initial seed
    r_t_k_1=r_0;
    i=1;
    while(i<=500) 
        % for each iteration.
        r_t_k= alpha*M'*r_t_k_1 + (beta*p_t) + (gamma*p_0);
        r_t_k_1=r_t_k;
        i=i+1;
        r_t_k(1:10);
    end
    % Add the converged rank vector to the topc
    R_T = horzcat(R_T,r_t_k);
    t=t+1;
    
end
end

