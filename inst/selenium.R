# Using RSelenium
library(RSelenium)
library(LinkedInCompany)

#source("getCompanyInfo.R")

remDr <- remoteDriver(browserName = "firefox")  # or google chrome
remDr$open()

u = "http://linkedin.com"
remDr$navigate(u)

#!!!!    Now login to LinkedIn using the new browser window.
#  enter your login and password in the two fields at the top of the window.


searchCompany("Eddie Bauer")


companyNames = c("Oracle", "Sun Microsystems", "Pandora", "Last.fm", "Macy's", "Bed Bath & Beyond", "Walgreens",
                 "Alcatel", "Genentech",  "Pfizer")

ans = list()
for(i in companyNames)  {
    print(i)
    try(ans[[i]] <- searchCompany(i))
}


saveRDS(ans, "CompanyInfo.Rds")









