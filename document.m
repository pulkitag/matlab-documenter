function [] = document(prms,varargin)

dfs = {'type','comment','figHandle',[],'figFile','',...
			 'text','','subcaption',''};
dfs = get_defaults(varargin,dfs,true);

nbData = load(prms.paths.nbInfo);
N      = length(nbData.type);
switch dfs.type
	case 'comment'
		if isfield(nbData,'comment')
			typeIndex = length(nbData.comment);
		else
			typeIndex = 0;
		end
		nbData.comment(typeIndex+1).text = dfs.text;
	
	case {'figure','multifigure'}
		if isfield(nbData,'figure')
			typeIndex = length(nbData.figure);
		else
			typeIndex = 0;
		end
		nbData.figure(typeIndex+1).caption = dfs.text;
	
		if strcmp(dfs.type,'figure')	
			figName = sprintf(prms.paths.figFile,typeIndex + 1);
			nbData.figure(typeIndex+1).isMulti    = false;
			nbData.figure(typeIndex+1).subCaption = {};		
	
			if ~isempty(dfs.figHandle)
					assert(isempty(dfs.figFile),'Cannot specify figName and handle simultaneously');
					export_fig(dfs.figHandle,figName,'-q25');
			else
					%Convert the file
					system(['convert ' dfs.figFile ' ' figName]); 
			end
		else
			%For making multiple figures.
			assert(iscell(dfs.figHandle),'figHandle must be a cell for multi-figure');
			figName = sprintf(prms.paths.multiFigFile,typeIndex + 1,'%d');
					
			nbData.figure(typeIndex+1).isMulti  = true;
			nbData.figure(typeIndex+1).numFig   = length(dfs.figHandle);
		
			[dirName,~,~] = fileparts(figName);
			if ~(exist(dirName,'dir')==7)
				system(['mkdir -p ' dirName]);
			end
			for n=1:1:length(dfs.figHandle)
				fName = sprintf(figName,n);
				export_fig(dfs.figHandle{n}, fName, '-q25');
				if ~isempty(dfs.subcaption)
					%This gives the user the option of not providing any subcaptions
					nbData.figure(typeIndex+1).subcaption{n} = dfs.subcaption{n};
				end
			end
		end		
		
		%Record the name of the figure. 
		nbData.figure(typeIndex+1).file    = figName;

	case 'table'
		error('Not Implemented');

	otherwise
		error('Type not recognized');
end

nbData.typeIndex(N+1) = typeIndex+1;
nbData.type{N+1}      = dfs.type;
nbData.ts{N+1}        = fix(clock); %Time-Stamp

fieldNames = fieldnames(nbData);
for f=1:1:length(fieldNames)
	fs = fieldNames{f};
	eval([fs ' = nbData.(fieldNames{f});']);
	if f==1
		save(prms.paths.nbInfo,fieldNames{f},'-v7.3');
	else
		save(prms.paths.nbInfo,fieldNames{f},'-append','-v7.3');
	end
end

%Always store a backup just in case. 
system(['cp ' prms.paths.nbInfo ' ' prms.paths.nbInfoBackup]); 
