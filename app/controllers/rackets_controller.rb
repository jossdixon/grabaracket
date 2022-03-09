class RacketsController < ApplicationController
  before_action :set_racket, only: %i[ show edit update destroy ]

  # GET /rackets or /rackets.json
  def index
    @rackets = Racket.all
  end

  # GET /rackets/1 or /rackets/1.json
  def show
  end

  # GET /rackets/new
  def new
    @racket = Racket.new
  end

  # GET /rackets/1/edit
  def edit
  end

  # POST /rackets or /rackets.json
  def create
    @racket = Racket.new(racket_params)

    respond_to do |format|
      if @racket.save
        format.html { redirect_to racket_url(@racket), notice: "Racket was successfully created." }
        format.json { render :show, status: :created, location: @racket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @racket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rackets/1 or /rackets/1.json
  def update
    respond_to do |format|
      if @racket.update(racket_params)
        format.html { redirect_to racket_url(@racket), notice: "Racket was successfully updated." }
        format.json { render :show, status: :ok, location: @racket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @racket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rackets/1 or /rackets/1.json
  def destroy
    @racket.destroy

    respond_to do |format|
      format.html { redirect_to rackets_url, notice: "Racket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_racket
      @racket = Racket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def racket_params
      params.require(:racket).permit(:brand, :model, :grip_size, :weight, :head_size)
    end
end
