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

