# Packages ----
library(jsonlite) ## for converting and reading JSON files
library(rjson) ## for converting and reading JSON files - a second alternative

# API initial checkup ----

## Let's check if we can get the API set up and running properly:

#* Health Check - Is the API running?
#* @apiTitle API health check
#* @apiDescription Checking if all is good with our API
#* @param msg Insert any text to submit our test
#* @get /echo
status <- function(msg ="") {
  list(msg = paste0("The message is: '", msg, "'"),
    status = "All good",
    time = Sys.time()
  )
}

# Exercise main goal ----

## To make it possible for people to send (e.g., through a website) new penguin
## collection data and have the API automatically return species probabilities.

  ## If we were to use a model created and stored outside this project, we
  ## could retrieve and save the model in a new object as in the following code:
  ## model_api <- readr::read_rds("/Users/guilherme/OneDrive/Git/04-GuilhermeLacerda-plumber/model.rds")

  ## If we were to run the predictions directly in R without the JSON files:
  ## predict(model_api, new_data = simulated_humboldt, type = "prob")
  ## predict(model_api, new_data = simulated_freie, type = "prob")

#* Predict species for new penguin
#* @post /predict
#* @serializer csv
function(req, res) {
  predict(model_api, new_data = simulated_humboldt, type = "prob")
}
