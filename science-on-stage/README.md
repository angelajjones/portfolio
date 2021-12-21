# Developing user profiles for an NPO using R and R Markdown
Earlier in 2021, I volunteered as a data analyst through the organisation [CorrelAid](https://correlaid.org/), which puts teams of volunteers interested in gaining real-world data analytics experience and/or helping to analyse data4good in touch with NPOs who have data that they'd like to use to gain insights but don't have anyone with the required expertise in-house.
My team worked with the NPO [Science on Stage](https://www.science-on-stage.de/), an organisation which develops STEM teaching materials and webinars aimed at teachers in Germany and the rest of the world, to analyse data on their webinar attendance and teaching materials downloads. They needed to track the usage patterns and user profiles of their products, not just to help improve them, but also to help them apply for grants to keep providing their services.
A secondary objective of this project was also to familiarise our Science on Stage liaison with R and the possibilities that processing and analysing data using a programming language offers. 
An important challenge was that our reports and processing pipelines also had to be easily usable by employees who needed to be able to download, process and generate customisable reports from data without any expertise in R or in data analytics more generally.
The organisation did not need any dashboards as they deal with reports in PDF and/or Microsoft Office Word format internally, so building a Shiny dashboard was not required. To accommodate their needs and preferences, we decided that using R Markdown to generate parametrized reports in Word or HTML format (the HTML format offered some interactive options which were helpful for getting an overview of the data in a more condensed format) was the best solution.

## My team
Our team of six split into three main sub-teams; mine focused on user data for the webinars, which came from Clickmeeting and Microsoft Teams.
The parametrised report format for our report specifically allows users to use a GUI to filter the data they want to see in the report, for example, by defining: 
* Whether they want data from all webinars within a set date range, whether they just want data for specific (named) webinars, or whether they want to use a combination of both filtering options
* A range of start and end times for the webinars (e.g., only webinars which took place between 17:00 and 19:00)
* Whether they want data only from Clickmeeting, or Teams, or both
* Whether they want data from webinars in German, in English, or both
* A file name for the report, or, if the field was left blank, a name was automatically generated with the system date

## What are the files in this folder?
This folder contains the scripts I either wrote myself or in collaboration with my teammates - it does not contain the entire workflow we delivered to Science on Stage.
There are two main scripts:
* `02_process_data_clickmeeting.Rmd` is an R Markdown file which takes care of the data processing (i.e., cleaning and reshaping for use in the analysis script). Users can just select `Run all chunks` in the RStudio interface without worrying too much about the contents.
* `03_analysis_data_clickmeeting.Rmd` is the main analysis script. Because Science on Stage did not have anyone trained in data analytics or statistics, we decided not to include any statistical models and concentrate on visualising the data instead. 

The other R scripts are the ones I wrote to actually render the report in HTML, with an eye towards usability. The `03_analysis_data_clickmeeting.Rmd` file is extremely long, complex, and potentially intimidating for non-technical users, and there is a high potential for human error if users were to try to render it directly using the RStudio interface or a rendering function. 
That is why I decided to write separate, short R scripts that they can run much more easily to generate the report in the format of their choice. This way, users never even have to open the main analysis script. First, they run `clickmeeting_renderhelp.R`, which defines the functions required to generate the report. Then, they run `clickmeeting_render_html.R`, which prompts the user to choose their desired filtering parameters in a browser and generates the actual HTML report. 

### Sample report
I also got permission from Science on Stage to provide a sample HTML report to demonstrate what it looked like, **using completely synthetic data**, so the data in the report in no way represents the actual users or attendance patterns of Science on Stage webinars. 
Since Github can only show HTML files in their raw state, here is a [link](https://htmlpreview.github.io/?https://github.com/angelajjones/portfolio/blob/main/science-on-stage/synthr.html) to the assembled report.
