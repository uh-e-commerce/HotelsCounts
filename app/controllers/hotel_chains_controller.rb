class HotelChainsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_hotel_chain, only: [:show, :edit, :update, :destroy]

  # GET /hotel_chains
  # GET /hotel_chains.json
  def index
    @hotel_chains = HotelChain.all
  end

  # GET /hotel_chains/1
  # GET /hotel_chains/1.json
  def show
  end

  # GET /hotel_chains/new
  def new
    @hotel_chain = HotelChain.new
  end

  # GET /hotel_chains/1/edit
  def edit
  end

  # POST /hotel_chains
  # POST /hotel_chains.json
  def create
    @hotel_chain = HotelChain.new(hotel_chain_params)

    respond_to do |format|
      if @hotel_chain.save
        format.html { redirect_to @hotel_chain, notice: 'Hotel chain was successfully created.' }
        format.json { render :show, status: :created, location: @hotel_chain }
      else
        format.html { render :new }
        format.json { render json: @hotel_chain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotel_chains/1
  # PATCH/PUT /hotel_chains/1.json
  def update
    respond_to do |format|
      if @hotel_chain.update(hotel_chain_params)
        format.html { redirect_to @hotel_chain, notice: 'Hotel chain was successfully updated.' }
        format.json { render :show, status: :ok, location: @hotel_chain }
      else
        format.html { render :edit }
        format.json { render json: @hotel_chain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotel_chains/1
  # DELETE /hotel_chains/1.json
  def destroy
    @hotel_chain.destroy
    respond_to do |format|
      format.html { redirect_to hotel_chains_url, notice: 'Hotel chain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel_chain
      @hotel_chain = HotelChain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hotel_chain_params
      params.require(:hotel_chain).permit(:name)
    end
end
