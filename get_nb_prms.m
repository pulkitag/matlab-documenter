function [prms] = get_nb_prms(varargin)

	dfs = {'nbName','%s'};
	dfs = get_defaults(varargin,dfs,true);

	%Get user configurations
	cnf = user_configs();

	%Specify the directory where you want the documentation data to be stored. 
	prms.paths.data   = cnf.dataDir;

	%List of all notebooks
	prms.paths.nbList = fullfile(prms.paths.data,'nb_list.mat'); 

	%Name of the notebook
	prms.paths.nb     = fullfile(prms.paths.data, dfs.nbName);

	%Notebook tex file
	prms.paths.nbTex  = fullfile(prms.paths.nb,'main.tex');

	%Notebook pdf file
	prms.paths.nbPdf  = fullfile(prms.paths.nb,'main.pdf');


	%Notebook info file
	prms.paths.nbInfo = fullfile(prms.paths.nb,'info.mat'); 
	prms.paths.nbInfoBackup = fullfile(prms.paths.nb,'info_backup.mat'); 
	
	%Notebook data folder
	prms.paths.nbData = fullfile(prms.paths.data, dfs.nbName, 'data');

	figDir             =  fullfile(prms.paths.nbData,'figure');
	prms.paths.figFile =  fullfile(figDir,'%d.pdf');
	prms.paths.multiFigFile =  fullfile(figDir,'multi%d/%s.pdf');
	if ~exist(figDir)
		system(['mkdir -p ' figDir]);
	end

	%Additional texfiles paths
	prms.paths.texDir = fullfile(prms.paths.data,'tex_data');
	if ~exist(prms.paths.texDir)
		system(['mkdir -p ' prms.paths.texDir]);
	end
end
