vim.g.dbs = {
  dev = "postgres://postgres:postgres@localhost:5432/mxgrn_dev",
  prod = os.getenv("DB_URI_PROD"),
}
