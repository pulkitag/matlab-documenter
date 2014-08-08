function [] = create_notebook(varargin)
% A new notebook
% 1. Create a folder in the data directory by the name of the notebook. 
% 2. Add the name of the notebook in notebooks.txt in the data directory. 
% 3. Create a data directory within the notebook directory for storing images etc. 
% 4. Create a main.tex within the notebook directory and initialize it. 
% 5. Label the following as:
%    Comments: C1, C2 ...
%    Tables:   T1, T2 ...
%    Figures:  F1, F2 ...
% 6. Each saved figure will be saved as: FigureNumber.pdf
% 7. A time stamp shall appear with all comments/tables/figures etc

dfs = {'name','my_notebook'};
dfs = get_defaults(varargin,dfs,true);

prms = get_prms({'nbName',dfs.name});

%Get the file for updating the notebook names
if exist(prms.paths.nbList,'file')==2
	oldNb = load(prms.paths.nbList);
	assert(isempty(intersect(oldNb.nbNames,dfs.name)),'Notebook alreadt exists');
	nbNames = oldNb.nbNames;
	nbNames{end+1} = dfs.name;
	save(prms.paths.nbList,'nbNames','-v7.3');
else
	nbNames{1} = dfs.name;
	save(prms.paths.nbList,'nbNames','-v7.3');
end

%Create the notebook folder
system(['mkdir -p ' prms.paths.nb]); 

%Create the notebook data folder
system(['mkdir -p ' prms.paths.nbData]); 

%Create the struct for storing the comments. 
typeIndex = []; %Comment number of a particular type. 
type      = {}; %Type of comment being stored
ts        = {}; %Time Stamp
save(prms.paths.nbInfo,'typeIndex','type','-v7.3');


end
