all: country_plot.png

clean:
	rm -f country.tsv reord_con_life.rds regression.rds country_plot.png remort.html

country.tsv: /Library/Frameworks/R.framework/Versions/3.4/Resources/library/gapminder/gapminder.tsv
	cp /Library/Frameworks/R.framework/Versions/3.4/Resources/library/gapminder/gapminder.tsv country.tsv

reord_con_life.rds: nest_asia.r country.tsv
	Rscript $<
	rm Rplots.pdf

regression.rds: reg_out.r reord_con_life.rds country.tsv
	Rscript $<
	rm Rplots.pdf

country_plot.png: reg_out.r reord_con_life.rds country.tsv
	Rscript $<
	rm Rplots.pdf

