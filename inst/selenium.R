# Using RSelenium
library(RSelenium)
source("getCompanyInfo.R")

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








if(FALSE) {
    # These are the low-level commands that are now in the searchCompany() function.
u = "https://www.linkedin.com/vsearch/f?type=all&keywords=University+of+Oklahoma&orig=GLHD&rsid=&pageKey=biz_companies_home_internal&trkInfo=tarId%3A1440541343889&search=Search"
remDr$navigate(u)

txt = remDr$getPageSource()
doc = htmlParse(txt, asText = TRUE)

href = getNodeSet(doc, "//div[@class = 'bd'][1]//a[1]/@href")[[1]]

u = getRelativeURL(href, "https://www.linkedin.com")
remDr$navigate(u)
txt = remDr$getPageSource()
doc = htmlParse(txt, asText = TRUE)
}


#https://www.linkedin.com/vsearch/c?type=companies&keywords=Macy%27s&orig=GLHD&rsid=1287253601440547337864&pageKey=voltron_company_search_internal_jsp&trkInfo=tarId%3A1440547370009&search=Search


# Not from linkedin project!
#el <- remDr$findElement(using = 'xpath', "//img[contains(@src, 'rating.png')]")
