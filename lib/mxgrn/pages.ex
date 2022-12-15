defmodule Mxgrn.Pages do
  @pages [
    blog: "/blog",
    projects: "/pages/projects",
    about: "/pages/about",
  ]

  def list, do: @pages
end
