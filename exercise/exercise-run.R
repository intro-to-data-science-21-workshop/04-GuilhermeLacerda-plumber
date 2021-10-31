# API initial checkup ----

#* Health Check - Is the API running?
#* @get /health-check
status <- function() {
  list(
    status = "All good",
    time = Sys.time()
  )
}

# Goal ----
## To make it possible for people to send (e.g., through a website) new penguin
## collection data and have the API automatically return species probabilities.

model_api <- readr::read_rds("model.rds")

predict(model_api, new_data = simulated, type = "prob")

#* Predict species for new penguin
#* @post /predict
function(req, res) {
  predict(model_api, new_data = simulated, type = "prob")
}