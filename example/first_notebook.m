%Delete if already existing
del_nb({'nbName','first_notebook'});

%Create a new notebook
create_notebook({'nbName','first_notebook','author','Ulkitan','title','Hello Documenter'});

%Get notebook prms
nbPrms = get_nb_prms({'nbName','first_notebook'});

%Add a text comment
document(nbPrms,{'type','comment','text','This is the first line'});

%Add a figure
im = uint8(255*rand(255,255,3));
fig = figure();
imshow(im);
document(nbPrms,{'type','figure','figHandle',fig,'text','Sample Figure - Random Noise'});

%Add a multifigure
numFigs = 4;
figHandle  = cell(numFigs,1);
subcaption = cell(numFigs,1);
for i=1:1:numFigs
	im = uint8(255*rand(255,255,3));
	figHandle{i}  = figure();
	imshow(im);
	subcaption{i} = sprintf('Random Noise: %d',i);
end
document(nbPrms,{'type','multifigure','figHandle',figHandle,...
						'text','Sample Figure - Random Noise','subcaption',subcaption});
