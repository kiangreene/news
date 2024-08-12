library(httr2)
library(jsonlite)
req <- request("https://newsapi.org/v2/everything") |>
  req_url_query(
    q = '`"data science"`',
    from = Sys.Date() - 1,
    pageSize = 10,
    apiKey = `env.NEWS_API_KEY`
  )

resp <- req_perform(req)
resp_body_json(resp)

jsonlite::write_json(resp_body_json(resp), path = file.path(getwd(), "data", paste0(lubridate::today(),".json")))
