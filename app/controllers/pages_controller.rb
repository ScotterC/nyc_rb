class PagesController < ApplicationController

  caches_page :home

  def home
    @title = "NYC RB Home"
  end

end