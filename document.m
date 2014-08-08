function [] = document(prms,varargin)

dfs = {'type','comment','figHandle',[],'figFile','',...
			 'text',''};
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
	
	case 'figure'
		if isfield(nbData,'figure')
			typeIndex = length(nbData.figure);
		else
			typeIndex = 0;
		end
		figName = sprintf(prms.paths.figFile,typeIndex + 1);
		nbData.figure(typeIndex+1).caption = dfs.text;
		nbData.figure(typeIndex+1).file    = figName;
		if ~isempty(dfs.figHandle)
				assert(isempty(dfs.figFile),'Cannot specify figName and handle simultaneously');
				export_fig(dfs.figHandle,figName,'-q25');
		else
				%Convert the file
				system(['convert ' dfs.figFile ' ' figName]); 
		end		

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
