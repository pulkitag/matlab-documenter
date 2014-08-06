function [prms] = get_prms(varargin)

	dfs = {'nbName','%s'};
	dfs = get_defaults(varargin,dfs,true);

	%Specify the directory where you want the documentation data to be stored. 
	prms.paths.data   = '/auto/k1/pulkit/Documentation/matlab/';

	%List of all notebooks
	prms.paths.nbList = fullfile(prms.paths.data,'nb_list.txt'); 

	%Name of the notebook
	prms.paths.nb     = fullfile(prms.paths.data, dfs.nbName);

	%Notebook tex file
	prms.paths.nbTex  = fullfile(prms.paths.nb,'main.tex');

	%Notebook info file
	prms.paths.nbInfo = fullfile(prms.paths.nb,'info.mat'); 
	
	%Notebook data folder
	prms.paths.nbData = fullfile(prms.paths.data, dfs.nbName, 'data');

	prms.paths.figFile = fullfile(prms.paths.nbData,'figure','%d.pdf');
end
