# Welcome to HW02 of Vibudh Agrawal

The link to [mark down](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw02/hw02.md) file  

## The over all pipeline:

![](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw02/graph.png?raw=true)

### Brief Explanation of how the pipeline works

- The data was extracted from gapminder library and put in file [country.tsv](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw02/country.tsv)
- Next this file i.e. country.tsv and rscript file [nest_asia.r](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw02/nest_asia.r) were used to generate another file named [reord_con_life.rds](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw02/reord_con_life.rds) which has the country.tsv data but continents are reordered based on lifeExp
    - Different plots are also drawn whose details can be found in markdown file [this](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw02/hw02.md)
    - The extra file that is created namely Rplots.pdf was removed
- Next regression data in the file [regression.rds](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw02/regression.rds) is obtained from reord_con_life.rds and Rscript [reg_out.r](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw02/reg_out.r)
    - What is done is explained in markdown file
- Finally the markdown file named [hw02.md](https://github.com/vibudh2209/STAT547M-hw-Agrawal-Vibudh/blob/master/hw02/hw02.md) was rendered using rmarkdown::render() command and taking inputs both country.tsv and regression.rds

## Progress Report

- It took me some time to get used to understand how makefile works and how and when use different commands
- Writing the Rscripts was straightforward as most of them had already been written before for some othe homework
- It also took me some time to work out my markdown file, what to include and how to include

## Resources used

- To understand how makefile works [class notes](http://stat545.com/automation04_make-activity.html) were used
- makefile2graph was implemented using [this](https://github.com/lindenb/makefile2graph) note
- Apart from them a lot of other material was taken from previous homeworks

    
 
