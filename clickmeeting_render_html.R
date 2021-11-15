library(here)
source(here("scripts/config.R")) 
source(here("scripts/ci.R")) 
source(here("scripts/webinar/clickmeeting_renderhelp.R"))

dir.create(here("reports/html/clickmeeting")) # only needs to be run the first time as it creates the clickmeeting subfolder in reports/pdf

render_html(params = "ask")
# run the following line AFTER the output file was saved 
#to clear your workspace so that future analyses aren't "contaminated" by previous values
rm(list = ls())
