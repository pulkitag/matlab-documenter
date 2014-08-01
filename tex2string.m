function [] = tex2string()
%COnverts the tex commands into approriate matlab code for generating 
% that tex command.

ipFile = fopen('tmp/texip.txt','r');
opFile = fopen('tmp/matlab_tex.txt','w');
fprintf(opFile,'s = ''''''; \n ');

tline = fgetl(ipFile);
while ischar(tline)
	s = ['s = strcat(s,' tline ');\n'];
	fprintf(opFile,s);	
	tline = fgetl(ipFile);
end

fclose(ipFile);
fclose(opFile); 
end
