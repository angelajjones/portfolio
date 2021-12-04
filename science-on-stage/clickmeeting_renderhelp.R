
library(here)
# render helper functions

render_html <- function(params, envir = parent.frame()) {
  rmarkdown::render(input = here("scripts/webinar/03_analysis_data_clickmeeting.Rmd"),
                    output_format = "distill::distill_article",
                    output_file = "temporary",
                    params = params,
                    envir = envir
  )
  
  dest <- str_c("reports/html/clickmeeting/", filename, "r.html")
  
  print(str_c("Moving temporary file to ", dest, "\n"))
  
  # move file to report folder and rename based on logic inside report (see Survey.Rmd)
  file.rename(from = "scripts/webinar/temporary.html", dest)
}




render_docx <- function(params, envir = parent.frame()) {
  rmarkdown::render(input = here("scripts/webinar/03_analysis_data_clickmeeting.Rmd"),
                    output_format = "word_document",
                    output_file = "temporary",
                    params = params,
                    envir = envir
  )
  
  dest <- str_c("reports/word/clickmeeting/", filename, "r.docx")
  
  print(str_c("Moving temporary file to ", dest, "\n"))
  
  # move file to report folder and rename based on logic inside report (see Survey.Rmd)
  file.rename(from = "scripts/webinar/temporary.docx", dest)
}

render_pdf <- function(params, envir = parent.frame()) {
   rmarkdown::render(input = here("scripts/webinar/03_analysis_data_clickmeeting.Rmd"),
                     output_format = "pdf_document",
                     output_file = "temporary",
                     params = params,
                     envir = envir)
  dest <- str_c("reports/word/clickmeeting/", filename, "r.pdf")
  
  print(str_c("Moving temporary file to ", dest, "\n"))
  
  # move file to report folder and rename based on logic inside report (see Survey.Rmd)
  file.rename(from = "scripts/webinar/temporary.pdf", dest)  
  
}
