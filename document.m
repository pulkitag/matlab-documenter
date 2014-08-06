function [] = document(prms,varargin)

dfs = {'type','comment','figHandle',[],'figFile','',...
			 'text',''};
dfs = get_defaults(varargin,dfs,true);

nbData = load(prms.paths.info);
N      = length(data.type);
switch dfs.type
	case 'comment'
		typeIndex = length(nbData.comment);
		nbData.comment(typeIndex+1).text = dfs.text;
	
	case 'figure'
		typeIndex = length(nbData.figure);
		figName = sprintf(prms.paths.figFile,typeIndex + 1);
		nbData.figure(typeIndex+1).caption = dfs.text;
		nbData.figure(typeIndex+1).file    = figName;
		if ~isempty(figHandle)
				assert(isempty(dfs.figFile),'Cannot specify figName and handle simultaneously');
		else
				%Convert the file
				system(['convert ' dfs.figFile ' ' figName]); 
		end		

	case 'table'
		error('Not Implemented');

	otherwise
		error('Type not recognized');

end
