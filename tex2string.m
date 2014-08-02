function [] = tex2string()
%COnverts the tex commands into approriate matlab code for generating 
% that tex command.

ipFile = fopen('tmp/texip.txt','r');
opFile = fopen('tmp/matlab_tex.txt','w');
fprintf(opFile,'s = ''''; \n ');

tline = fgetl(ipFile);
escChars = utils.get_escape_characters();

while ischar(tline)
	for i=1:1:length(escChars)
		st = strfind(tline,escChars{i});
		for j=1:1:length(st)
			tline = [tline(1:st(j)-1+(j-1)) '\' tline(st(j)+(j-1):end)];
		end
	end
	st = strfind(tline,'%');
	for j=1:1:length(st)
			tline = [tline(1:st(j)-1+(j-1)) '%' tline(st(j)+(j-1):end)];
	end

	s = ['s = strcat(s,''' tline ''');\n'];
	fprintf(opFile,s);	
	tline = fgetl(ipFile);
end

fclose(ipFile);
fclose(opFile); 
end
