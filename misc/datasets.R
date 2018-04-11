

#-------- tutorial 1 dataset----------
library(stringr)
traj_0_dat = 'https://raw.githubusercontent.com/MingChen0919/gst-colloquium-workshop-2018/master/content/datasets/John_datasets/protein_folder/traj_0.dat'
feature_names = str_split(readLines(traj_0_dat)[1], '--')[[1]]
feature_names = gsub('DIST: ', '', feature_names)
feature_names = gsub(' - ', '_', feature_names)
feature_names = gsub(' ', '_', feature_names)

trajectory = read.table(traj_0_dat, header = FALSE, sep = ' ', comment.char = 'D', stringsAsFactors = FALSE)
colnames(trajectory) = feature_names

dim(trajectory)

tics = read.table(file = 'content/datasets/John_datasets/protein_folder/traj_0.energy_tics.dat', header = FALSE, comment.char = 'E')
colnames(tics) = c('Energy', 'TIC0', 'TIC1')
save(trajectory, tics, file = 'content//datasets/exercise_1.RData')



#--------- tutorial 2 dataset ---------
energy_tics_url = 'https://raw.githubusercontent.com/MingChen0919/gst-colloquium-workshop-2018/master/content/datasets/John_datasets/traj_1.energy_tics.dat'
energy_tics = read.table(energy_tics_url, header = TRUE, stringsAsFactors = FALSE)
energy_tics$frame_index = 1:nrow(energy_tics)
energy_tics = energy_tics[, c(6, 1:5)]

macrostate = vector(mode = 'integer')
macrostate[which((energy_tics$TIC0 < 3) & (energy_tics$TIC1 > -2))] = 1
macrostate[which((energy_tics$TIC0 < 3) & (energy_tics$TIC1 > -4.5) & (energy_tics$TIC1 <= -2) )] = 2
macrostate[which((energy_tics$TIC0 < 3) & (energy_tics$TIC1 <= -4.5))] = 3
macrostate[which(energy_tics$TIC0 >= 3)] = 4
energy_tics$macrostate = macrostate

# microstate_trajectory_url = 'https://raw.githubusercontent.com/MingChen0919/gst-colloquium-workshop-2018/master/content/datasets/John_datasets/traj_0.microclusters.dat'
# microstate_trajectory = t(read.table(microstate_trajectory_url, header = FALSE, stringsAsFactors = FALSE))
# macrostate_trajectory_url = 'https://raw.githubusercontent.com/MingChen0919/gst-colloquium-workshop-2018/master/content/datasets/John_datasets/traj_0.macroclusters.dat'
# macrostate_trajectory = t(read.table(macrostate_trajectory_url, header = FALSE, stringsAsFactors = FALSE))
# energy_tics$microstate = microstate_trajectory


# save data into .RData
save(trajectory, energy_tics, file = 'content/datasets/datasets.RData')

