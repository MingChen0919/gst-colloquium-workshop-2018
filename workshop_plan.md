TODO 
- Ming: doodle poll for regular meeting
- Everyone: see **for next week** section
- final choice of expression dataset
- next week presentation slides
	- including example for each plot type?
- Later
	- after assignments are finalized, we need to exactly list out 
		- what the data is down to the syntax / format of data files
		- what is the simple version of plot (ie x- and y-axes values are from the data)
		- what are the features / enhancements to make
			- 1 new enhancement per plot is probably the limit we could handle with 8 total plots. maybe some plots we will go super fast and make trivial changes between the 2 examples, and get more time/features on other plots.
		- at which plot do we introduce what concepts
			- how to choose color scheme
			- axis stacking
			- etc

**Model of Workshop**
 - Parallel workup of 4 plot types with 2 data sets
	 - progression from simpler plotting with less analysis to more advanced plotting with processed data
 - 5-10 minutes of background on data sets 
	 - This is the "biological context"
	 - Data sets are: (need to make final choice for expression data)
		 - Expression Data of (*protein/RNA*)
		 - MD Simulation Data of protein folding
 - 5 minutes types of plots and what they fundamentally show
 - 5-7 minutes on relevant clustering and PCA methods
	 - the data processing we do to move beyond raw data
 - 5-7 minutes on the meaning of the processed data
	 - in the realm of biological context
 - 30 minutes per plot average. Some we might want to spend more time, some less
	 - examine the 'raw' data for the plot
	 - look at simplest code for plot type with the raw data
	 - expansion to view the specific features of the figure that are included to enhance the display & examination of the data
 
 **For next week**
- For presentation to class
	- Info slides to introduce plan & context
	- Plot slides: titles and examples of plot types
	- Info slides:
		- slide to explain the Workshop Model
			- same plot types exemplified by 2 datasets, with some processing along the way
		- slide to describe each data set
		- slide to describe plotting & analysis progression (PCA & clustering processing)
			- 4 plot types, exemplified twice via each dataset
				- raw data & simple code first
				- expansion for featurization of additional dimensions of data
				- reminder of what processing happened to data & corresponding interpretation

 - For us:
	 - assign yourself to (at least) 2 plot types. for some of us, more might makes sense.
		 - put at 'X' for your assignment, or an 'R' if you have some R experience instead of the 'X'
			 - John will get data for all the MD plots ready, but has NO experience with R!
			 - each row should have some R plz
		 - consider the distribution of people when you look at the table, not just your comfort zone!
			 - since we're really just finding informative ways to plot data, if its 'your type' of data is really secondary and more important is to create multifaceted plots with expressive features beyond the simple version
			 - we pretty much have the story for each data as a given, so we can all learn what we need for that
		 - by MONDAY, find example plot of the plot types you choose and push to repo. maybe just upload the whole publication and mention the figure number(s).
	 

**Personnel Assingments**
 - I cannot remember if we said whether we want to include the plot examples in our presentation to class, or just list out the plot types and data progression!? 
 - Who will present broad concept of workshop to the class
	 - Ming
		 - Expression dataset
		 - Simple to featurized idea for obtaining each final plot
		 - Scatterplot examples
		 - Heatmap examples
	 - John
		 - Introduce Workshop Model: datasets, plot types, progression
		 - Learning Goals
		 - MD dataset
		 - PCA scatterplot examples
		 - Network plot examples
 
|  | Ming | John | Karthik | Jaili | Shawn | Jennifer | Amanda | Pawat | Sanjeev |
|--|--|--|--|--|--|--|--|--|--|--|
| ScatterPlot-EX |  |  |  |  |  |  |  |  |  |
| ScatterPlot-MD |  | X |  |  |  |  |  |  |  |
| PCA Scatter-EX |  |  |  |  |  |  |  |  |  |
| PCA Scatter-MD |  | X |  |  |  |  |  |  |  |
| Heatmap-EX |  |  |  |  |  |  |  |  |  |
| Heatmap-MD |  | X |  |  |  |  |  |  |  |
| Network-EX |  |  |  |  |  |  |  |  |  |
| Network-MD |  | X |  |  |  |  |  |  |  |

**Learning Goals**
- Overview of plot types & meaning
- Demonstrate how plotting concepts can be creatively ‘deployed’ using programmatic plotting utilities \(R\)
	- build up from simple plot
	- featurization utilities in R
- Tutorialize 4 advanced plots effective for showing big data

**Installation**
- 1 week ahead installation for participants
- sample data and scripts to do importing & sample processing
	- read sample data: lets make noise
	- output sample plots
	- run by oracle script we give them
