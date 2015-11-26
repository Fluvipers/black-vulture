class ReportsController < ApplicationController

  def index
    @data = Fact.last.properties
  end

end
