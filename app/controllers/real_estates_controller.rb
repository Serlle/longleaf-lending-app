class RealEstatesController < ApplicationController
  before_action :set_real_estate, only: %i[ show edit update destroy ]

  # GET /real_estates or /real_estates.json
  def index
    @real_estates = RealEstate.all
  end

  # GET /real_estates/1 or /real_estates/1.json
  def show
  end

  # GET /real_estates/new
  def new
    @real_estate = RealEstate.new
  end

  # GET /real_estates/1/edit
  def edit
  end

  # POST /real_estates or /real_estates.json
  def create
    @real_estate = RealEstate.new(real_estate_params)
    @real_estate.profit = @real_estate.calculate_estimated_profit

    respond_to do |format|
      if @real_estate.save
        format.html { redirect_to real_estate_url(@real_estate), notice: "Real estate profit and return calculator was successfully created." }
        format.json { render :show, status: :created, location: @real_estate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @real_estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /real_estates/1 or /real_estates/1.json
  def update
    respond_to do |format|
      if @real_estate.update(real_estate_params)
        @real_estate.profit = @real_estate.calculate_estimated_profit
        @real_estate.save
        format.html { redirect_to real_estate_url(@real_estate), notice: "Real estate profit was successfully updated." }
        format.json { render :show, status: :ok, location: @real_estate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @real_estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /real_estates/1 or /real_estates/1.json
  def destroy
    @real_estate.destroy

    respond_to do |format|
      format.html { redirect_to real_estates_url, notice: "Real estate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_real_estate
      @real_estate = RealEstate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def real_estate_params
      params.require(:real_estate).permit(:address, :loan_term, :purchase_price, :repair_budget, :arv, :first_name, :last_name, :phone_number, :email)
    end
end
