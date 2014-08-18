function [nbNames] = get_nb_names()
%Displays and returns the names of notebooks

prms  = get_nb_prms();

if exist(prms.paths.nbList,'file')==2
	oldNb   = load(prms.paths.nbList);
	nbNames = oldNb.nbNames;
	for n=1:1:length(nbNames)
		disp(nbNames{n});
	end 
else
	disp('No notebooks exist');
	nbNames = {};
end


end
