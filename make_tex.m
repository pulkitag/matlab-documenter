function [] = make_tex(prms)
%Generates the tex file from the notes structure.

%Get the notebook data
nbData = load(prms.paths.nbInfo);

%Get user_configs
cnf = user_configs();

%Open the texfile
fid    = fopen(prms.paths.nbTex,'w');

%Get the preamble
s   = get_tex(prms,{'texType','preamble','author',nbData.author,'title',nbData.title,...
					'stylePkg',cnf.stylePkg});
fprintf(fid,s); 

%Write the Comments
for i=1:1:length(nbData.type)
	idx = nbData.typeIndex(i);
	switch nbData.type{i}
		case 'comment'
			s = get_tex(prms,{'texType','comment','text',nbData.comment(idx).text});
		case 'figure'
			s = get_tex(prms,{'texType','figure','figNum',idx,...
						'figFile',nbData.figure(idx).file,...
						'figCaption',nbData.figure(idx).caption});
		otherwise
			error('Not Recognized')
	end
	fprintf(fid,s);
end

s = get_tex(prms,{'texType','end'});
fprintf(fid,s);
fclose(fid);
end


function [identifier,dateStr] = get_identifier()

	time    = fix(clock);
	time(7) = random();
	time(8) = random();
	identifier = sprintf('%d-%d-%d-%d-%d-%d-%d-%d',time);

	dateStr = sprintf('%d\/%d\/%d %d:%d',time(3),time(2),time(1),time(4),time(5));
	varargout{1} = dateStr;	

end
