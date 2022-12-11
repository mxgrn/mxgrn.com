defmodule Mxgrn.Pages do
  @pages [
    blog: "/blog",
    about: "/pages/about"
  ]

  def list, do: @pages
end
