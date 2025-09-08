{
  local shop = Input("ex-shoptet-permalink-shop-name"),
  name: if shop != null && shop != "" then shop + " Orders & Products" else "Shoptet Orders & Products",
  isDisabled: false,
}
