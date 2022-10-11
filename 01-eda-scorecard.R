# practice conducting EDA with U.S. college data (2018-2019) 

# load required packages
library(tidyverse)
library(rcis)

# view header of the dataset
scorecard
glimpse(scorecard)

# view help file for the dataset
?scorecard


# QUESTION 1. Which type of college has the highest average SAT score?

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
  facet_wrap(facets = vars(________))

## using a frequency polygon
ggplot(
  data = ________,
  mapping = aes(x = ________, color = ________)
) +
  geom_________()

## What do these graphs reveal about average SAT scores by type of college?
## Provide a couple of sentences to interpret the graphs (preface each line with a #)



## QUESTION 2. Based on these results, we can further inquiry our data to check the
## observations that have valid SAT averages scores, thus filtering all the "NA":

# drop "NA" with drop_na()
_________ %>%
  drop_na(________) %>%
  ggplot(
    mapping = aes(x = type)
  ) +
  geom_bar()

# what proportion of observations have NA for satavg?
scorecard %>%
  group_by(_______) %>%
  summarize(prop = sum(is.na(satavg)) / n()) %>%
  ggplot(
    mapping = aes(x = type, y = prop)
  ) +
  geom_col()

## What do these graphs reveal?
## Provide a couple of sentences to interpret it (preface each line with a #)



## QUESTION 3. What is the relationship between net cost of attendance and faculty salaries? 
## How does this relationship differ across types of colleges?

## using geom_point


## using geom_hex


## improve one of the two graphs to make it more clear/informative





## BONUS - QUESTION 4. How are a college's Pell Grant recipients related to the average student's education debt?
## Determine and use the most appropriate plot, and improve its appearances

