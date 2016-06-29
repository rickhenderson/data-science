# Learning how to use tidyr from Swirl
# Created by Rick Henderson
# Created on March 22, 2016

# Don't run this code, just use it as examples for the commands.
# Probably need to convert this to a Markdown file.
?gather
gather(students, sex, count, -grade)
students2
res <- gather(students2, sex_class, count, -grade)
res
?separate
separate(res, sex_class, c("sex", "class"))
?spread
extract_numeric("class5")
?mutate

# Extract 3 columns from the dataset because it contains "multiple observational units".
# It should be split into multiple tables due to redundant repeated data.
student_info <- students4 %>%
  select(id ,name ,sex ) %>%
  print

# Dataset contains duplicate rows so... just keep the unique rows.
student_info <- students4 %>%
  select(id, name, sex) %>%
  unique() %>%
  print

# Create the other table of just id and grade info
gradebook <- students4 %>%
  select(id, class, midterm, final) %>%
  print

?unique
submit()
passed <- mutate(passed, status="passed")
failed <- mutate(failed, status="failed")
?bind_rows

# Combines two tables together. Different nrows, same ncols.
bind_rows(passed, failed)

# Now with the SAT Data from http://research.collegeboard.org/programs/sat/data/cb-seniors-2013

sat %>%
  select(-contains("total")) %>%
  gather(part_sex, count, -score_range) %>%
  separate(part_sex, c("part", "sex")) %>%
  group_by(part, sex) %>%
  mutate(total = sum(count),
         prop = count/total) %>% 
  print
