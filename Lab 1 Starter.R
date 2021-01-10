# This is an "R Script": a file containing R code that can be run all at once 
#   or bit by bit. 

# Text after a pound sign like this is called a "comment". Comments get ignored
#   by the interpreter (do not get executed). Comments are used to document code,  
#   provide instructions, etc. In RStudio the keystroke Ctrl-Shift-C can be used to 
#   Comment or Uncomment a line. 


# Run this library command (select it and use the button to the upper-right).
# We will use Tidyverse whenever we use R. The command below loads a set of packages
#   so they are available throughout a project. This must be run for any of the
#   subsequent code to work. 
library(tidyverse)


# Replace the text and run the command. This will assign your name to an object 
#   for use in captions. 
myname <-  "Your Name"



##### PRIMER 1 - Programming Basics #####

# Lab Note: As you proceed through the remainder of this, each numbered problem  
#  corresponds to a section of the Google Doc. Copy the requested code and  
#  output into the doc.


# 1. Names of variables in mpg dataframe
# RUN the command provided below to show the names of the variables in the mpg 
#   dataframe. Make note of the case of variable names. R is "case-sensitive",  
#   so you must match the case when typing variable names. 
names(mpg)


# 2. Boxplot of Highway Gas Mileage by Class of Vehicle
# In the "A Code Template" section of the primer you produced a boxplot. Copy  
#   the code you used in the primer and paste it below. Then run it. 


# For all subsequent plots, I want your name to appear at the bottom of the 
#   graph. In ggplot2, labs() adds various labels to a graph. You'll use labs()   
#   to add a caption with your name. 
# Before proceeding with the rest of the assignment, do these two things to learn
#   about labs() and how to use it. 
# Run this command to see documentation for labs()
?labs

# Run the command below to demonstrate a use of labs(). Then, replace 
#   "Some Caption" (including the quotation marks) with myname (the name
#    of the object you created above.)
ggplot() +
  labs(caption="Some Caption")


# 3. Scatterplot of Highway Gas Mileage vs Engine Displacement
# Paste the code to produce the scatterplot with blue dots that you made in the  
#   Aesthetic mappings section of the primer. Run it here to make sure it works. 
# Then, to the end of your code add a labs() layer to add your name as a caption. 
#   I would copy from above. Don't forget the plus (must be at the end of the 
#   previous line.) 



##### PRIMER 2 - Programming Basics #####

# 4. Histogram of generated normal data
# In the "Objects" section of this primer you generated 100 random normal 
#   observations, saved them to an object named "data," and then produced a 
#   histogram.
# Copy and paste that code here. Then modify that code so that the name of the  
#    object you create is your first name rather than "data". You'll need to  
#    change the object name in both commands. 


# 5. Create a list and extract an element.
# In the "Lists" section of this primer you were given an assignment command
#   and asked to extract the number 1001 from that list. 
# Copy and paste both commands here. Then change two things. First, change the 
#   value of the last element to be the name of your hometown instead of 
#   "stories". Then, in the second command extract the name of your hometown 
#   instead of 1001. 



##### Exercise #####

# 6. Scatterplot of Black Cherry Trees Data
# Now use what you've learned to create a scatter plot from a different dataset.
# First, use these two commands to learn about the trees dataset. The head()  
#   function shows just the first few rows of a dataframe.
?trees
head(trees)

# Now, write code to produce a scatter plot of tree diameter (x-axis) vs height. 
#   Note, it's always reasonable to copy/paste/modify previous code. 
# Refer to the output from above to determine the correct variable names (& be 
#   sure to match the case.)
# Include your name as a caption once again like you did in problem 4.


##### Guided Deep-Dive #####

# 7. Trump Approval Estimates Over Time
# Read the description in the Google Doc before proceeding. 

# Import latest data directly from 538. The dataset contains daily approval estimates 
#   since the start of his term. There are three estimates for each day, labeled 
#   "Adults", "Voters", and "All polls". 
# The three-line command below could be read as "Read this file, subset the data to 
#   only include the rows for All polls, create a new variable FixedDate that's 
#   properly sortable, and then assign the resulting data to an object named djt. 
# Run the following 4 lines (2 commands) to import the data and view it. 
djt <- read_csv("https://projects.fivethirtyeight.com/trump-approval-data/approval_topline.csv") %>%
  filter(subgroup=="All polls") %>%
  mutate(FixedDate = as.Date(modeldate, format="%m/%d/%Y"))
View(djt)

# Create a line graph to visualize estimated approval over time. Once again, add 
#   code to include your name as a caption.
ggplot(data=djt) +
  geom_line(aes(y=approve_estimate, x=FixedDate)) 
