library(shinytest2)

test_that("Bins input value", {
  app <- AppDriver$new()

  app$click(
    input = "submit"
  )

  bins <- app$get_value(
    output = "print_bins"
  )

  expect_equal(
    as.numeric(bins),
    30
  )
})

test_that("Bins input value reactivity", {
  app <- AppDriver$new()

  app$set_inputs(
    set_bins = 50
  )

  # app$click(
  #   input = "submit"
  # )

  bins <- app$get_value(
    output = "print_bins"
  )

  expect_equal(
    as.numeric(bins),
    50
  )
})
