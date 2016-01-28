class FactsController < ApplicationController
  
  def index
    @facts = find_line.facts
  end

  def create
    @fact = Fact.new(fact_params)
    @fact.line_id = find_line.id

    respond_to do |format|
      if @fact.save
        format.html { redirect_to facts_path(@line), notice: 'Fact succesfully created.' }
        format.json { render :show, location: @fact }
      else
        format.html { redirect_to facts_path(@line) }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @fact = Fact.find(params[:fact][:id])
    update_properties(fact_params[:properties])
    respond_to do |format|
      if @fact.save
        format.json { render :update, location: @fact }
      else
        format.json { render json: @fact.errors, status: :unprocessable_action }
      end
    end
  end

  private
    def find_line
      @line = Line.find_by_name(params[:fact][:line])
    end

    def fact_params
      params.require(:fact).permit().tap { |whitelisted| whitelisted[:properties] = params[:fact][:properties]}
    end

    def update_properties(properties)
      properties.each do |key, value|
        @fact.properties[key] = value if @fact.properties[key]
      end
    end
end
