function [] = del_nb(varargin)
% Deletes the notebook

dfs = {'nbName',''};
dfs = get_defaults(varargin,dfs,true);

prms = get_nb_prms({'nbName',dfs.nbName}); 

if ~(exist(prms.paths.nbList,'file')==2)
	disp('There are no notebooks, so cant delete anything');
	return;
else
	oldNb = load(prms.paths.nbList);
	if isempty(intersect(oldNb.nbNames,dfs.nbName))
		disp(sprintf('No notebook with name %s found',dfs.nbName));
		return;
	end	
	system(['rm -r ' prms.paths.nb]);
	system(['rm -r ' prms.paths.nbData]);

	[~,ia] = intersect(oldNb.nbNames,dfs.nbName,'stable');
	nbNames = cell(length(oldNb.nbNames)-1,1);
	count = 1;
	for i=1:1:length(oldNb.nbNames)
		if i==ia
			continue;
		end
		nbNames = oldNb.nbNames{i}
	end

	save(prms.paths.nbList,'nbNames','-v7.3');
end



end
