# load required packages
library(tidyverse)
library(rcfss)

# view header of the dataset
scorecard
glimpse(scorecard)

# view help file for the dataset
?scorecard

# Which type of college has the highest average SAT score?
# Use a graph to visualize your answer.

## using a boxplot
ggplot(
  data = ________,
  mapping = aes(x = ________, y = ________)
) +
  geom_________()

## using a faceted histogram
ggplot(
  data = ________,
  mapping = aes(x = ________)
) +
  geom_________() +
  facet_wrap(~ ________)

## using a frequency polygon
ggplot(
  data = ________,
  mapping = aes(x = ________, color = ________)
) +
  geom_________()

## Is there something unusual or problematic about our analysis of
## this data given what we have seen so far? Use a graph to illustrate this
ggplot() + ...

# What is the relationship between net cost of attendance and faculty salaries?
# How does this relationship differ across types of colleges?
ggplot() + ...

# How are a college's Pell Grant recipients related to the average student's education debt?
ggplot() + ...
