function [] = get_tex(varargin)
% Get the tex command for various types.
% figure

dfs = {'texType',[],'numFigure',1};
dfs = get_defaults(varargin,dfs,true);

s = '';
switch dfs.texType
	case 'preamble'
		\documentclass{article} % For LaTeX2e
		\usepackage{nips14submit_e,times}
		\usepackage{hyperref}
		\usepackage{url}
		\usepackage[pdftex]{graphicx}
		\usepackage{float}
		\usepackage{subfig,caption}
		\usepackage{verbatim,amsmath}
		\usepackage{onimage}
		\newcommand{\squeezeup}{\vspace{-5mm}}
		\newcommand{\moveup}{\vspace{-4.5mm}}
		\title{%s}
		\author{%s} 
		\newcommand{\fix}{\marginpar{FIX}}
		\newcommand{\new}{\marginpar{NEW}}
		\nipsfinalcopy % Uncomment for camera-ready version
		\begin{document}
		\maketitle


	case 'figure'
		s = strcat(s,'\begin{figure}[t!] \n');
		s = strcat(s,'\centering \n');
		s = strcat(s,'\subfloat{\includegraphics[width=%f\linewidth]{img/%s} } \n');
		s = strcat(s,'\caption{%s} \n');
		s = strcat(s,'\label{fig:%s} \n');
		s = strcat(s, '\end{figure} \n');
		
	case 'multifigureHor'
		%When you want to place multiple figures side to side horizontally
		s = strcat(s,'\begin{figure}[t!] \n');
		s = strcat(s,'\centering \n');
		for i=1:1:dfs.numFigure
			s = strcat(s,'\subfloat{\includegraphics[width=%f\linewidth]{img/%s} } \n');
		end
		s = strcat(s,'\caption{%s} \n');
		s = strcat(s,'\label{fig:%s} \n');
		s = strcat(s, '\end{figure} \n');

	otherwise
		error('Tex-Type not recognized');
end
