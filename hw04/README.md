# Welcome to hw04

The link to foofactors package of mine is [this](https://github.com/vibudh2209/foofactors)

The link to Readme of package is [this](https://github.com/vibudh2209/foofactors/blob/master/README.md)

The link to vignettes is [this](https://github.com/vibudh2209/foofactors/blob/master/vignettes/hello-foofactors.Rmd)

# Brief explanation about all my functions

- I started by forking foofactors made by jenny from [here](https://github.com/jennybc/foofactors)

- So it already had fbind which binds two factors and freq_out which provides the frequency table output for each factor. These are NOT done by me so don't count them as my contribution

## Here onwards are functions made by me and their tests

- Fact_detect [here](#header1)
- Fact_reord [here](#header2)
- Fact_orig [here](#header3)

<a name=header1>
</a>

### First is fact_detect

The role of the function is to detect factors that should be character because # unique values = length

The link to [r file](https://github.com/vibudh2209/foofactors/blob/master/R/fact_detect.r)

- The input type is just factor not character and if the factor should be character the output is TRUE else FALSE
- Just checks the length of levels and characters and if same then returns false else returns true
- Did some input check so that only factor input is there

The testthat.t file is [this](https://github.com/vibudh2209/foofactors/blob/master/tests/testthat/test_fact_detect.r)

- Here two identical cases are when ones its true and ones its false and one error case is when something other than factor is inputted

<a name=header2>
</a>

### Second is Fact_reord

Its a version of reorder from stat package using dplyr::desc() and reorders the levels of a given input to the desired order.

The link to [r file](https://github.com/vibudh2209/foofactors/blob/master/R/fact_reord.r)

- The input can be a character array or factor array along with the order in which you want your factors to be (i.e. length of both inputs should be same)
- The working is pretty simple as it converts the character array to vector using desc().
- Then it starts with first word in the level and if there are more tham one occurance then it will take the average value inputted in y for that.
- After that just the level are ordered based on ordering of these averaged value for each levels using order()
- Then it returns the factor that is reordered as output
- Done some input check so that lenght of x and y are same and y is anumeric vector.

The testthat.t file is [this](https://github.com/vibudh2209/foofactors/blob/master/tests/testthat/test_fact_reord.r)

- The one identical test is very straightforward while there are two error tests for unequal vector length and when y is not numeric

<a name=header3>
</a>

### Third is fact_orig.r

Its similar to factor reorder but returns the factor with levels reordered in the same way as the input

the link to [r file](https://github.com/vibudh2209/foofactors/blob/master/R/fact_orig.r)

- The input is just some character array or factor array
- Done check on input so that inputs are one of the above
- First get all the unique values from input
- Then send them to fact_reord with these unique values and a numeric vector of 1:length(these unique values)
- The output is levels arranged in the same order as unique values
- Then just assign these levels to that of input vector x
-The return type is factor

The testthat.r file is [this](https://github.com/vibudh2209/foofactors/blob/master/tests/testthat/test_fact_orig.r)

- Two accept identical are there onw with redundant words in input other with already unique input. The error is the case when the input is numeric.

# The progress

- I was stuck with fact_reord.r for a long time as I was not getting output factor with same characters after reordering the levels. So finally I got over it using [this](https://stackoverflow.com/questions/2375587/reorder-levels-of-a-factor-without-changing-order-of-values)
- Fall most of the other part i took help from the [jenny's](http://stat545.com/packages06_foofactors-package.html) tutorial.
- I was also stuck for sometime because I was not able to knit README as well as vinettes, I realised that I did not installed the package thats why functions were not read.







