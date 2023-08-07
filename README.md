# voxp

The `voxp` package is a handy tool for finding the most common value of a variable in a dataset. 
It implements the `assign.majority` function, which takes a dataset with a unique identifier column and a defining variable, and a proportion threshold as an input. 
The function returns the most frequent value of the defining variable for each identifier as long as it meets or exceeds the proportion threshold.

## Installation

You can install the latest version of `voxp` from github with:

``` r
# install.packages("devtools")
devtools::install_github("https://github.com/Thomas-Browne/voxp")
```

## Usage

Here is an example of how to use the `assign.majority` function:

``` r
library(voxp)

data <- data.frame(
  id = c(1, 1, 1, 2, 2, 3),
  color = c("red", "red", "blue", "green", "green", "green")
)

assign.majority(data, id, color, threshold = 0.5)
#>   id color
#> 1  1   red
#> 2  2 green
#> 3  3 green
```

## Contributing

Contributions to this package are welcome. You can contribute by:

- Reporting bugs or issues on GitHub.
- Suggesting new features or improvements on GitHub.
- Forking this repository and submitting a pull request.
