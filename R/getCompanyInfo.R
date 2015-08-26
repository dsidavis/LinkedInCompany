#https://www.linkedin.com/lite/secure-web-action-track?csrfToken=ajax:5094796386609083053

getCompanyInfo =
function(doc)
{
   els = c("founded", "company-size", "type", "industry", "specialties")
   ans = lapply(els, function(t) 
                     xpathSApply(doc, sprintf("//li[contains(@class, '%s')]//p", t), xmlValue))

    names(ans) = els
    lapply(ans, trim)
}

searchCompany =
    #
    # searchCompany("Eddie Bauer")
    #
function(company, sel, url = "https://www.linkedin.com/vsearch/c",
         params = c(type = "companies", keywords= company, orig = "GLHD", rsid = "1287253601440547320558", pageKey = "voltron_company_search_internal_jsp",
           trkInfo = "tarId:1440547337517", search = "Search"))
{
  u = sprintf("%s?%s", url, paste(names(params), params, sep = "=", collapse = "&"))
  remDr$navigate(u)
  txt = remDr$getPageSource()
  doc = htmlParse(txt, asText = TRUE)
  res = getSearchResults(doc)

  remDr$navigate(res)
  txt = remDr$getPageSource()
  doc = htmlParse(txt, asText = TRUE)  
  getCompanyInfo(doc)
}

getSearchResults =
function(doc)
{    
#    txt = remDr$getPageSource()
#    doc = htmlParse(txt, asText = TRUE)

    href = getNodeSet(doc, "//div[@class = 'bd'][1]//a[1]/@href")[[1]]
    getRelativeURL(href, "https://www.linkedin.com")
}





trim =
function (x) 
gsub("(^[[:space:]]+|[[:space:]]+$)", "", x)    
