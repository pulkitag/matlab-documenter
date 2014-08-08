function [] = make_tex(prms)
%Generates the tex file from the notes structure.

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
