matlab-documenter
=================

matlab-documenter provides a convenient and intuitive interface to document research/expexperimental work while using matlab. Using this package, notebooks can be created and mantained. The notebooks are available as .tex files, which can be easily compiled into ..pdf. 

Requirements
------------

	- export\_fig
	- pdflatex
	- convert
	- texlive-fonts-recommended
	- texlive-science

Setup
-------

You need to specify the path where you want matlab-documenter to save its internal data.
Modify user\_configs to set the user variables. You dont need to modify anything else. 

All style files required by tex should be stored in path-to-matlab-documenter-data/tex\_data/

Create a notebook
------------------

create\_notebook({'name','my-notebook','author','author-name','title','title-of-my-motebook'});



Adding text comments
--------------------

nbPrms = get\_nb\_prms({'nbName','my-notebook'});

comment(nbPrms,{'type','comment','text','This is my first comment'});


Adding figures
---------------

 - Provide a figure handle in which plot has been created
	
	 comment(nbPrms,{'type','figure','figHandle',gcf,'text','Mu first figure caption'});

 - Provide an already saved figure
	
	 comment(nbPrms,{'type','figure','figFile','name-of-file','text','Figure caption'});


Generating Tex File
--------------------

make\_tex(nbPrms);

Tex file will be generated in path-to-matlab-documenter-data/my-notebook/

Use pdflatex to get your .pdf documentation!


Fixes to possible errors
-------------------------

Error in using evince over ssh -X, try the following:

sudo ln -s /etc/apparmor.d/usr.bin.evince /etc/apparmor.d/disable

sudo /etc/init.d/apparmor restart

Also, in /etc/init.d/apparmor/tunables/home - ensure that your home directory is listed in HOME variable.

