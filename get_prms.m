function [prms] = get_prms(varargin)

	dfs = {'nbName','%s'};
	dfs = get_defaults(varargin,dfs,true);

	%Specify the directory where you want the documentation data to be stored. 
	prms.paths.data   = '/auto/k1/pulkit/Documentation/matlab/';

	%List of all notebooks
	prms.paths.nbList = fullfile(prms.paths.data,'nb_list.mat'); 

	%Name of the notebook
	prms.paths.nb     = fullfile(prms.paths.data, dfs.nbName);

	%Notebook tex file
	prms.paths.nbTex  = fullfile(prms.paths.nb,'main.tex');

	%Notebook info file
	prms.paths.nbInfo = fullfile(prms.paths.nb,'info.mat'); 
	prms.paths.nbInfoBackup = fullfile(prms.paths.nb,'info_backup.mat'); 
	
	%Notebook data folder
	prms.paths.nbData = fullfile(prms.paths.data, dfs.nbName, 'data');

	figDir             =  fullfile(prms.paths.nbData,'figure');
	prms.paths.figFile =  fullfile(figDir,'%d.pdf');
	if ~exist(prms.paths.figFile)
		system(['mkdir -p ' figDir]);
	end
end
