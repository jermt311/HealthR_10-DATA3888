# Project III - Public health and COVID 

This project aims to develop and deploy a visualisation dashboard to enable students or academia in research interested in COVID-19 to explore the population level COVID-19 and its impact on society. This dashboard was created using a mix of `R` and `HTML` elements and deployed using `R shiny`. All that is required to run the shiny app can be found within this folder titled `Shiny_App` from thos github repository. After cloning to your local machine and ensuring all the required libraries are installed, the app should be able to run.

## Libraries Used

To ensure that there are no version issues when running the source code of the dashboard, please ensure the following libraries are installed and updated to the latest versions.

- shiny
- ggplot2
- dplyr
- tidyr
- DT
- knitr
- kableExtra
- ggtheme
- plotly
- sparkline
- rsconnect
- shinythemes
- waffle
- shinyWidget
- tidyverse
- readxl
- tibble
- janitor
- reshape2
- ggplot2
- ggthemes
- plotly
- pheatmap
- maps
- zoo
- dendextend
- proxy
- lubridate
- forecast
- readr
- fpp2
- sparkline
- TTR
- tseries

## File path

Ensure that the following file paths are changed to your local directory.

### server.R

- 1) Ensure that 'documentation.html' is in the same folder as server.R
- 2) Ensure that 'about.html' is in the same folder as server.R

### Global.R

Ensure that all file paths are pointed towards the data from the file `data`. If the folder `data` has been shifted, ensure the following dataframe definitions follow the file path accordingly. The dataframe definations can be found on the following lines;

- 1) Line 28, vaccination.csv
- 2) Line 37, country_vaccinations.csv
- 3) Line 77, covid-19-testing-policy.csv
- 4) Line 100, owid-testing.csv
- 5) Line 116, https://covid19.who.int/WHO-COVID-19-global-data.csv (For this data, it is directly loaded from the website. Should you wish to make it static, download it to the folder `data` and change the filepath respectively.
- 6) Line 202, OxCGRT_latest.csv
