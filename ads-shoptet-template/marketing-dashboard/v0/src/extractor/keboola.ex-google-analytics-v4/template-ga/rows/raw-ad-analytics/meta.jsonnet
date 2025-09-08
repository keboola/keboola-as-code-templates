{
  local shop = Input("ex-shoptet-permalink-shop-name"),
  name: if shop != null && shop != "" then shop + " raw_ad_analytics" else "raw_ad_analytics",
  isDisabled: false,
}
