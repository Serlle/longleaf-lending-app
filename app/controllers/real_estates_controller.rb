class RealEstatesController < ApplicationController
  before_action :set_real_estate, only: %i[ show edit update destroy ]
  before_action :authorize_user, except: %i[ show create ]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_real_estate

  # GET /real_estates or /real_estates.json
  def index
    @real_estates = RealEstate.all
  end

  # GET /real_estates/1 or /real_estates/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        # I included a corresponding view template
        render pdf: "Termsheet - #{@real_estate.first_name + @real_estate.last_name}", 
               template: 'real_estates/termsheet'
      end
    end
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
    @real_estate.loan_amount = @real_estate.calculate_loan_amount
    @real_estate.profit = @real_estate.calculate_estimated_profit

    respond_to do |format|
      if @real_estate.save
        # Send the email with Sidekiq
        SendTermsheetJob.perform_later(@real_estate)
        format.turbo_stream { @notice = 'The real estate profit and profitability calculation was successfully created.' }
        format.html { redirect_to loans_home_url }
        format.json { render :show, status: :created, location: @real_estate }
      else
        format.turbo_stream { @real_estate = @real_estate }
        format.html { render 'loans/home', status: :unprocessable_entity }
        format.json { render json: @real_estate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /real_estates/1 or /real_estates/1.json
  def update
    respond_to do |format|
      if @real_estate.update(real_estate_params)
        @real_estate.loan_amount = @real_estate.calculate_loan_amount
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

    # Authorize user for restricted actions
    def authorize_user
      unless action_name.in?(%w[show create])
        redirect_to loans_home_url, alert: 'Access restricted.'
      end
    end
    
    # Invalid real estate if real estate doesn't exist
    def invalid_real_estate
      logger.error "Attempt to access invalid raeal estate #{params[:id]}"
      redirect_to loans_home_url, alert: 'Invalid real estate'
    end
end
