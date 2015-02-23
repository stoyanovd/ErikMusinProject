class LetteringsController < ApplicationController
  before_action :set_lettering, only: [:show, :edit, :update, :destroy]

  # GET /letterings
  # GET /letterings.json

  include ApplicationHelper

  def index
    @letterings_1 = get_dir_entries("app/assets/images/pngs/Lettering/pc")
    @letterings_2 = get_dir_entries("app/assets/images/pngs/Lettering/hand")
  end

  # GET /letterings/1
  # GET /letterings/1.json
  def show
  end

  # GET /letterings/new
  def new
    @lettering = Lettering.new
  end

  # GET /letterings/1/edit
  def edit
  end

  # POST /letterings
  # POST /letterings.json
  def create
    @lettering = Lettering.new(lettering_params)

    respond_to do |format|
      if @lettering.save
        format.html { redirect_to @lettering, notice: 'Lettering was successfully created.' }
        format.json { render :show, status: :created, location: @lettering }
      else
        format.html { render :new }
        format.json { render json: @lettering.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /letterings/1
  # PATCH/PUT /letterings/1.json
  def update
    respond_to do |format|
      if @lettering.update(lettering_params)
        format.html { redirect_to @lettering, notice: 'Lettering was successfully updated.' }
        format.json { render :show, status: :ok, location: @lettering }
      else
        format.html { render :edit }
        format.json { render json: @lettering.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letterings/1
  # DELETE /letterings/1.json
  def destroy
    @lettering.destroy
    respond_to do |format|
      format.html { redirect_to letterings_url, notice: 'Lettering was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lettering
    @lettering = Lettering.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lettering_params
    params.require(:lettering).permit(:name)
  end
end
