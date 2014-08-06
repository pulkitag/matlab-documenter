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

prms = get_prms({'name',dfs.name});

%Get the file for updating the notebook names
if ~exist((prms.paths.nbList,'file')==2)
	nbFid = fopen(prms.paths.nbList,'w');
else
	nbFid = fopen(prms.paths.nbList,'ra');
	%Read the existing notebook names and make sure its a new-name. 
	nextLine = fgets(nbFid);
	while ischar(nextLine)
		if strcmp(nextLine(1:end-2),dfs.name)
			error('Name already exists');
		end
	end
end

%Create the notebook folder
system(['mkdir -P ' prms.paths.nb]); 

%Create the notebook data folder
system(['mkdir -P ' prms.paths.nbData]); 

%Create main.tex
fid = fopen(prms.paths.nbTexFile,'w');
[texStr,numLines] = get_tex({'texType','preamble'});
fprintf(fid,texStr);



end
