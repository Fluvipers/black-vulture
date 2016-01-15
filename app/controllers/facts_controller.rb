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
    respond_to do |format|
      if @fact.update(task_params)
        format.html { redirect_to facts_path(@line), notice: 'Fact succesfully updated.' }
        format.json { render :show, status: :ok, location: @fact } 
      else
        format.html { redirect_to facts_path(@line) }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def find_line
      @line = Line.find_by_name(params[:fact][:line])
    end

    def fact_params
      par = params.require(:fact).permit().tap do |whitelisted|
        whitelisted[:properties] = params[:fact][:properties]
      end
      par
    end
end
