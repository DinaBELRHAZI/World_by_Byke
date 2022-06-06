require 'net/http'
class VelosController < ApplicationController
  before_action :set_velo, only: %i[ show edit update destroy ]

  # GET /velos or /velos.json
  def index
    @velos = Velo.all

  end

  # GET /velos/1 or /velos/1.json
  def show
  end

  # GET /velos/new
  def new
    @velo = Velo.new
  end

  # GET /velos/1/edit
  def edit
  end

  # POST /velos or /velos.json
  def create
    @velo = Velo.new(velo_params)

    respond_to do |format|
      if @velo.save
        format.html { redirect_to velo_url(@velo), notice: "Le vélo a été ajouté avec succès." }
        format.json { render :show, status: :created, location: @velo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @velo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /velos/1 or /velos/1.json
  def update
    respond_to do |format|
      if @velo.update(velo_params)
        format.html { redirect_to velo_url(@velo), notice: "Le vélo a été modifié avec succès." }
        format.json { render :show, status: :ok, location: @velo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @velo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /velos/1 or /velos/1.json
  def destroy
    @velo.destroy

    respond_to do |format|
      format.html { redirect_to velos_url, notice: "Le vélo a été supprimé avec succès." }
      format.json { head :no_content }
    end
  end

  public
    # Use callbacks to share common setup or constraints between actions.
    def set_velo
      @velo = Velo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def velo_params
      params.require(:velo).permit(:name, :company, :city, :country, :latitude, :longitude)
    end
end
