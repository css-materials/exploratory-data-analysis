# Practice conducting EDA with U.S. college data (2018-2019) -- solutions

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

## What do these graphs reveal about average SAT scores by type of college?
# According to this graphs, "private, nonprofit" schools have the highest average SAT score,
# followed by "public" and then "private, for-profit" schools. 
# But this doesn't reveal the entire picture. 
# From the last two graphs, we can also see the averages for each college type are 
# based on widely varying sample sizes.


## QUESTION 2. Based on these results, we can further inquiry our data to check the
## observations that have valid SAT averages scores, thus filtering all the "NA":

# drop "NA" with drop_na()
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

## What do these graphs reveal?
## There are far fewer private, for-profit colleges than the other categories.
## Private, for-profit colleges disproportionately fail to report average SAT scores 
## compared to the other categories (likely these schools do not require SAT scores) 


## QUESTION 3. What is the relationship between net cost of attendance and faculty salaries? 
## How does this relationship differ across types of colleges?

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

## using geom_hex()
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
  facet_grid(cols = vars(type)) +
  labs(
    title = "Net cost of attenance and faculty salaries by type of college (2018-2019)",
    x = "Students net cost of attendance",
    y = "Average faculty salary"
  )

# Take home point: several iterations and improvements might be necessary
# to reveal a pattern and produce a clear graph
# You might want to add title and label the axis to your final product


## BOUNUS - QUESTION 4. How are a college's Pell Grant recipients related to the average student's education debt?
## Determine and use the most appropriate plot, and improve its appearances

## two continuous variables suggest a scatterplot would be appropriate
ggplot(
  data = scorecard,
  mapping = aes(x = pctpell, y = debt)
) +
  geom_point()

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
