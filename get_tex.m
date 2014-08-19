function [s] = get_tex(prms,varargin)
% Get the tex command for various types.
% figure

dfs = {'texType',[],'numFigure',1,'author','','title','',...
			 'figNum','','figFile','','figCaption','','figWidth',1.0,...
			 'text','','stylePkg','nips14submit_e'};
dfs = get_defaults(varargin,dfs,true);

s = '';
switch dfs.texType
	case 'preamble'
		s = strcat(s,' \\documentclass{article} %% For LaTeX2e',' \n ');  
		s = strcat(s,' \\usepackage{', fullfile(prms.paths.texDir,dfs.stylePkg),...
					',times}',' \n ');  
		s = strcat(s,' \\usepackage{hyperref}',' \n ');  
		s = strcat(s,' \\usepackage{url}',' \n ');  
		s = strcat(s,' \\usepackage[pdftex]{graphicx}',' \n ');  
		s = strcat(s,' \\usepackage{float}',' \n ');  
		s = strcat(s,' \\usepackage{subfig,caption}',' \n ');  
		s = strcat(s,' \\usepackage{verbatim,amsmath}',' \n ');  
		%s = strcat(s,' \\usepackage{onimage}',' \n ');  
		s = strcat(s,' \\newcommand{\\squeezeup}{\\vspace{-5mm}}',' \n ');  
		s = strcat(s,' \\newcommand{\\moveup}{\\vspace{-4.5mm}}',' \n ');  
		s = strcat(s, sprintf(' \\'), sprintf('\\title{ %s }',dfs.title),' \n ');  
		s = strcat(s, sprintf(' \\'),sprintf('\\author{ %s }',dfs.author),' \n ');  
		s = strcat(s,' \\newcommand{\\fix}{\\marginpar{FIX}}',' \n ');  
		s = strcat(s,' \\newcommand{\\new}{\\marginpar{NEW}}',' \n ');  
		s = strcat(s,' \\nipsfinalcopy %% Uncomment for camera-ready version',' \n ');  
		s = strcat(s,' \\begin{document}',' \n ');  
		s = strcat(s,' \\maketitle',' \n ');  

	case 'figure'
		s = strcat(s,'\\begin{figure}[t!] \n ');
		s = strcat(s,'\\centering \n ');
		s = strcat(s,'\\subfloat{\\includegraphics',...
									 sprintf('[width=%.2f',dfs.figWidth), '\\linewidth]',...
									 sprintf('{%s} }',dfs.figFile), ' \n ');
		s = strcat(s, sprintf('\\'), sprintf('\\caption{%s} ',dfs.figCaption), ' \n ');
		s = strcat(s, sprintf('\\'), sprintf('\\label{fig:figure%d}',dfs.figNum), ' \n ');
		s = strcat(s,'\\end{figure} \n ');

		keyboard;	
	
	case 'multifigureHor'
		%When you want to place multiple figures side to side horizontally
		s = strcat(s,'\begin{figure}[t!] \n ');
		s = strcat(s,'\centering \n ');
		for i=1:1:dfs.numFigure
			s = strcat(s,'\subfloat{\includegraphics[width=%f\linewidth]{img/%s} } \n ');
		end
		s = strcat(s,'\caption{%s} \n ');
		s = strcat(s,'\label{fig:%s} \n ');
		s = strcat(s, '\end{figure} \n ');

	case 'comment'
		s = strcat(s,dfs.text,'\n \n'); 

	case 'end'
		s = strcat(s,'\\end{document} \n ');

	otherwise
		error('Tex-Type not recognized');
end
end

