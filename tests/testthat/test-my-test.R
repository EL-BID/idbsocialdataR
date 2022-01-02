test_that("get indicator", {
  test <- idbsocialdataR:::query_indicator(indicator="pobreza", countries="ARG",
                          yearstart = "2010", yearend = "2010")

  expect_equal(test$value, 14.21867)
})
