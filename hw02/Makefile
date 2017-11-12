all: hw02.html

clean:
	rm -f country.tsv reord_con_life.rds regression.rds hw02.html remort.html

country.tsv: /Library/Frameworks/R.framework/Versions/3.4/Resources/library/gapminder/gapminder.tsv
	cp /Library/Frameworks/R.framework/Versions/3.4/Resources/library/gapminder/gapminder.tsv country.tsv

reord_con_life.rds: nest_asia.r country.tsv
	Rscript $<
	rm Rplots.pdf

regression.rds: reg_out.r reord_con_life.rds country.tsv
	Rscript $<
	rm Rplots.pdf

hw02.html: hw02.rmd regression.rds country.tsv
	Rscript -e 'rmarkdown::render("$<")'