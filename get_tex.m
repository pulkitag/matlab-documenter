function [s,varargout] = get_tex(varargin)
% Get the tex command for various types.
% figure

dfs = {'texType',[],'numFigure',1};
dfs = get_defaults(varargin,dfs,true);

s = '';
switch dfs.texType
	case 'preamble'
		s = strcat(s,'\documentclass{article} % For LaTeX2e',' \n ');  
		s = strcat(s,'\usepackage{nips14submit_e,times}',' \n ');  
		s = strcat(s,'\usepackage{hyperref}',' \n ');  
		s = strcat(s,'\usepackage{url}',' \n ');  
		s = strcat(s,'\usepackage[pdftex]{graphicx}',' \n ');  
		s = strcat(s,'\usepackage{float}',' \n ');  
		s = strcat(s,'\usepackage{subfig,caption}',' \n ');  
		s = strcat(s,'\usepackage{verbatim,amsmath}',' \n ');  
		s = strcat(s,'\usepackage{onimage}',' \n ');  
		s = strcat(s,'\newcommand{\squeezeup}{\vspace{-5mm}}',' \n ');  
		s = strcat(s,'\newcommand{\moveup}{\vspace{-4.5mm}}',' \n ');  
		s = strcat(s,'\title{%s}',' \n ');  
		s = strcat(s,'\author{%s} ',' \n ');  
		s = strcat(s,'\newcommand{\fix}{\marginpar{FIX}}',' \n ');  
		s = strcat(s,'\newcommand{\new}{\marginpar{NEW}}',' \n ');  
		s = strcat(s,'\nipsfinalcopy % Uncomment for camera-ready version',' \n ');  
		s = strcat(s,'\begin{document}',' \n ');  
		s = strcat(s,'\maketitle',' \n ');  

	case 'figure'
		s = strcat(s,'\begin{figure}[t!] \n ');
		s = strcat(s,'\centering \n ');
		s = strcat(s,'\subfloat{\includegraphics[width=%f\linewidth]{img/%s} } \n ');
		s = strcat(s,'\caption{%s} \n ');
		s = strcat(s,'\label{fig:%s} \n ');
		s = strcat(s, '\end{figure} \n ');
		
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

	case 'identifier'

	case 'end'
		s = strcat(s,'\end{document} \n ');

	otherwise
		error('Tex-Type not recognized');
end
end

function [numLines] = count_lines(s)
%Lines are counted using ' \n ' (Notice there is an empty space before and after the \n'

	numLines = length(strfind,' \n ');
end


end


