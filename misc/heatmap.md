Import and parse data
=====================

    library(tidyr)
    library(ggplot2)

    ## Warning: package 'ggplot2' was built under R version 3.3.3

    library(reshape2)

    ## 
    ## Attaching package: 'reshape2'

    ## The following object is masked from 'package:tidyr':
    ## 
    ##     smiths

    data_path <- '../datasets/john_datasets/traj_0.dat'
    feature_names = stringr::str_split(readLines(data_path)[1], '--')[[1]]

    # feature names have space and special characters. These characters are not good for variable names.
    # let's encode feature names
    names(feature_names) = paste0('V_', 1:length(feature_names))
    data_raw = read.table(data_path, header = FALSE, sep = ' ', comment.char = 'D', stringsAsFactors = FALSE)
    colnames(data_raw) = names(feature_names)
    str(data_raw)

    ## 'data.frame':    5001 obs. of  29 variables:
    ##  $ V_1 : num  0.39 0.391 0.386 0.389 0.39 0.377 0.383 0.391 0.382 0.392 ...
    ##  $ V_2 : num  0.663 0.676 0.683 0.648 0.673 0.702 0.68 0.654 0.632 0.704 ...
    ##  $ V_3 : num  0.931 0.946 0.934 1.001 0.954 ...
    ##  $ V_4 : num  0.854 0.853 0.798 1.158 0.982 ...
    ##  $ V_5 : num  0.373 0.387 0.385 0.374 0.389 0.39 0.386 0.387 0.369 0.381 ...
    ##  $ V_6 : num  0.568 0.583 0.573 0.653 0.579 0.559 0.6 0.568 0.55 0.574 ...
    ##  $ V_7 : num  0.583 0.585 0.54 0.77 0.664 0.563 0.595 0.562 0.541 0.6 ...
    ##  $ V_8 : num  0.392 0.376 0.392 0.382 0.381 0.377 0.383 0.39 0.375 0.386 ...
    ##  $ V_9 : num  0.565 0.533 0.556 0.672 0.543 0.549 0.555 0.569 0.557 0.573 ...
    ##  $ V_10: num  0.375 0.394 0.393 0.386 0.382 0.39 0.386 0.381 0.385 0.376 ...
    ##  $ V_11: num  0.146 0.372 0.03 0.452 -0.282 -0.629 0.189 -0.073 0.001 -0.428 ...
    ##  $ V_12: num  -0.989 -0.928 -1 -0.892 -0.959 -0.777 -0.982 -0.997 -1 -0.904 ...
    ##  $ V_13: num  0.663 -0.543 -0.125 0.281 -0.972 0.34 0.032 0.444 0.542 0.046 ...
    ##  $ V_14: num  -0.749 -0.84 -0.992 -0.96 0.234 -0.941 -0.999 -0.896 -0.84 -0.999 ...
    ##  $ V_15: num  0.202 -0.191 0.392 -0.356 0.063 0.188 -0.247 0.549 0.207 0.304 ...
    ##  $ V_16: num  -0.979 -0.982 -0.92 -0.935 -0.998 -0.982 -0.969 -0.836 -0.978 -0.953 ...
    ##  $ V_17: num  -0.752 -0.81 -0.676 -0.726 -0.554 -0.947 -0.885 -0.342 -0.775 -0.893 ...
    ##  $ V_18: num  0.659 0.586 0.737 0.687 0.832 0.322 0.465 0.94 0.631 0.451 ...
    ##  $ V_19: num  0.143 -0.067 0.101 -0.448 0.422 0.199 -0.332 0.233 -0.083 0.318 ...
    ##  $ V_20: num  -0.99 -0.998 -0.995 -0.894 -0.907 -0.98 -0.943 -0.973 -0.997 -0.948 ...
    ##  $ V_21: num  0.901 0.977 0.871 0.012 0.984 0.963 0.99 0.812 0.967 0.843 ...
    ##  $ V_22: num  -0.434 -0.213 -0.491 -1 -0.176 -0.269 -0.141 -0.583 -0.255 -0.538 ...
    ##  $ V_23: num  0.239 0.451 0.094 0.463 0.137 0.633 -0.017 0.324 -0.027 0.135 ...
    ##  $ V_24: num  -0.971 -0.893 -0.996 -0.887 -0.991 -0.774 -1 -0.946 -1 -0.991 ...
    ##  $ V_25: num  0.962 0.996 0.988 -0.652 0.818 0.873 0.996 0.869 0.997 0.982 ...
    ##  $ V_26: num  -0.272 0.091 -0.152 0.758 -0.575 -0.487 0.084 -0.495 0.076 -0.19 ...
    ##  $ V_27: num  0.659 0.66 0.68 0.668 0.641 0.65 0.659 0.639 0.65 0.685 ...
    ##  $ V_28: num  0.629 0.426 0.436 0.946 0.407 0.388 0.581 0.684 0.49 0.4 ...
    ##  $ V_29: num  0.414 0.367 0.336 0.39 0.382 0.345 0.419 0.327 0.305 0.351 ...

    # add frame index
    data_raw$frame_index = 1:nrow(data_raw)

Cluster data
============

    #Set frame index as row names
    rownames(data_raw) <- data_raw$frame_index
    data_raw$frame_index <- NULL

    #ensure NA values omitted
    data_clean <- na.omit(data_raw)

    #K-means cluster analysis using 5 clusters
    fit <- kmeans(data_clean,5)

    #get cluster means
    aggregate(data_clean, by=list(fit$cluster), FUN=mean)

    ##   Group.1       V_1       V_2       V_3       V_4       V_5       V_6
    ## 1       1 0.3864216 0.5795147 0.8200392 1.0091324 0.3839853 0.6232941
    ## 2       2 0.3861668 0.5584778 0.5629884 0.6852939 0.3835578 0.5617977
    ## 3       3 0.3866490 0.6219201 0.7275961 0.7663591 0.3837926 0.5645153
    ## 4       4 0.3888116 0.5847391 0.8511449 0.9336377 0.3842899 0.5783768
    ## 5       5 0.3865188 0.5558796 0.5425049 0.6517113 0.3837001 0.5571901
    ##         V_7       V_8       V_9      V_10        V_11       V_12
    ## 1 0.8851863 0.3836667 0.5871225 0.3836716 -0.01580882 -0.9302206
    ## 2 0.5762502 0.3840882 0.5716206 0.3842392  0.23544224 -0.9258578
    ## 3 0.5906804 0.3843402 0.5706849 0.3840978  0.06433124 -0.8665171
    ## 4 0.6110870 0.3852754 0.5739130 0.3830870  0.49524638  0.8513478
    ## 5 0.5546657 0.3845886 0.5709749 0.3840246  0.35143980 -0.9100623
    ##          V_13       V_14       V_15       V_16      V_17         V_18
    ## 1 -0.44979902 -0.3360882 0.10500000  0.1877500 0.7237843 -0.132308824
    ## 2  0.47783185 -0.8055455 0.05460219 -0.9326247 0.8782611 -0.380066302
    ## 3 -0.46816786 -0.3559785 0.16273429 -0.9371023 0.1319937  0.002055655
    ## 4  0.01904348 -0.9288406 0.02342029 -0.9450290 0.6060145  0.598710145
    ## 5  0.42782799 -0.8310460 0.28963970 -0.9251915 0.8220014 -0.515545793
    ##          V_19       V_20       V_21       V_22       V_23       V_24
    ## 1  0.12638235 -0.9301716 0.04590686  0.5400441 0.11262745 -0.9546569
    ## 2 -0.16006083 -0.9561839 0.92619207 -0.2316077 0.16704443 -0.9457710
    ## 3  0.07880969 -0.9491490 0.88440485 -0.3424650 0.17067594 -0.9376670
    ## 4 -0.01402899 -0.9165507 0.80071014 -0.2684638 0.09227536 -0.9424058
    ## 5  0.28560623 -0.9418080 0.80941934 -0.5418712 0.18198047 -0.9361432
    ##        V_25       V_26      V_27      V_28      V_29
    ## 1 0.5274216 -0.1871667 0.5077794 0.6008382 0.6392010
    ## 2 0.8907437 -0.1103589 0.3553199 0.3818366 0.3913014
    ## 3 0.8122837 -0.2939417 0.4859794 0.4350341 0.3789219
    ## 4 0.7394348 -0.1607391 0.4262899 0.5845217 0.4143478
    ## 5 0.7584440 -0.6220642 0.3451330 0.3395174 0.3586267

    #append cluster assignment and id
    data_kmean <- cbind(data_clean, id=seq(nrow(data_clean)), cluster=fit$cluster)

    #add id sort to order id numbers by cluster
    data_kmean$idsort <- data_kmean$id[order(data_kmean$cluster)]
    data_kmean$ idsort <- order(data_kmean$idsort)

    #reshape2:: melt to make data.frame in long format
    data_long <- melt(data_kmean, id.vars=c("id", "idsort"))

    #plot heatmap
    ggplot(data_long, aes(x=variable, y=idsort)) +
      geom_tile(aes(fill=value))

![](heatmap_files/figure-markdown_strict/unnamed-chunk-2-1.png)

    #Hierarchical heatmap
    #Convert clean data to matrix
    data_matrix <- as.matrix(data_clean)

    #plot heatmap
    heatmap(data_matrix)

![](heatmap_files/figure-markdown_strict/unnamed-chunk-2-2.png)
