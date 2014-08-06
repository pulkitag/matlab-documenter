function [] = write_tex(prms,s,varargin)
% writes data to tex file, each note is preceded by a begin and end comment which contains the id number of the note. 
% Possible comment types:
% 1. comment
% 2. table
% 3. figure
% 4. init % Special tag while initializing the notebook

dfs = {'commentType','comment'};
varargin = get_defaults(varargin,dfs,true);

[key,timeStamp] = get_identifier();


end


function [identifier,dateStr] = get_identifier()

	time    = fix(clock);
	time(7) = random();
	time(8) = random();
	identifier = sprintf('%d-%d-%d-%d-%d-%d-%d-%d',time);

	dateStr = sprintf('%d\/%d\/%d %d:%d',time(3),time(2),time(1),time(4),time(5));
	varargout{1} = dateStr;	

end
