# load required packages
library(tidyverse)
library(rcis)

# view header of the dataset
scorecard
glimpse(scorecard)

# view help file for the dataset
?scorecard

# Which type of college has the highest average SAT score?
# Use a graph to visualize your answer.

## using a boxplot
ggplot(
  data = scorecard,
  mapping = aes(x = type, y = satavg)
) +
  geom_boxplot()

## using a faceted histogram
ggplot(
  data = scorecard,
  mapping = aes(x = satavg)
) +
  geom_histogram() +
  facet_wrap(facets = vars(type))

## using a frequency polygon
ggplot(
  data = scorecard,
  mapping = aes(x = satavg, color = type)
) +
  geom_freqpoly()

## Now we can see the averages for each college type
## are based on widely varying sample sizes
scorecard %>%
  drop_na(satavg) %>%
  ggplot(
    mapping = aes(x = type)
  ) +
  geom_bar()

# what proportion of observations have NA for satavg?
scorecard %>%
  group_by(type) %>%
  summarize(prop = sum(is.na(satavg)) / n()) %>%
  ggplot(
    mapping = aes(x = type, y = prop)
  ) +
  geom_col()

## There are far fewer private, for-profit colleges than the other categories.
## Private, for-profit colleges disproportionately fail to report average SAT scores
## compared to the other categories.
## 
## A boxplot alone would not reveal this detail, which could be important in future analysis

# What is the relationship between college attendance cost and faculty salaries?
# How does this relationship differ across types of colleges?

## using geom_point()
ggplot(data = scorecard,
       mapping = aes(x = netcost, y = avgfacsal)) +
  geom_point() +
  geom_smooth()

## geom_point() with alpha transparency to reveal dense clusters
ggplot(data = scorecard,
       mapping = aes(x = netcost, y = avgfacsal)) +
  geom_point(alpha = .2) +
  geom_smooth()

## geom_hex()
ggplot(data = scorecard,
       mapping = aes(x = netcost, y = avgfacsal)) +
  geom_hex() +
  geom_smooth()

## geom_point() with smoothing lines for each type
ggplot(data = scorecard,
       mapping = aes(x = netcost,
                     y = avgfacsal,
                     color = type)) +
  geom_point(alpha = .2) +
  geom_smooth()

## geom_point() with facets for each type
ggplot(data = scorecard,
       mapping = aes(x = netcost,
                     y = avgfacsal,
                     color = type)) +
  geom_point(alpha = .2) +
  geom_smooth() +
  facet_grid(cols = vars(type))

# How are a college's Pell Grant recipients related to the average student's education debt?
## Two continuous variables suggest a scatterplot would be appropriate
ggplot(
  data = scorecard,
  mapping = aes(x = pctpell, y = debt)
) +
  geom_point()

## jittered scatterplot
ggplot(
  data = scorecard,
  mapping = aes(x = pctpell, y = debt)
) +
  geom_jitter()

## geom_point() with alpha transparency
ggplot(
  data = scorecard,
  mapping = aes(x = pctpell, y = debt)
) +
  geom_point(alpha = .2)

## geom_hex()
ggplot(
  data = scorecard,
  mapping = aes(x = pctpell, y = debt)
) +
  geom_hex()

## with a smoothing line
ggplot(
  data = scorecard,
  mapping = aes(x = pctpell, y = debt)
) +
  geom_point(alpha = .2) +
  geom_smooth()
