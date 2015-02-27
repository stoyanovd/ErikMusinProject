class IllustrationsController < ApplicationController
  before_action :set_illustration, only: [:edit, :update, :destroy]

  # GET /illustrations
  # GET /illustrations.json

  include ApplicationHelper

  def index
    @pckgs = get_dir_entries("app/assets/images/pngs/illustration")
  end

  # GET /illustrations/1
  # GET /illustrations/1.json
  def show
  end
  
  def extra
    @pckg = params[:package]
    unless ["BASE" , "BLUE MAGIC" , "get taxi","GRAPHICS" ,"ORIGINAL","POSTER BASE"].include?(@pckg)
      render '/public/404.html', :status => '404' and return
    end
    print @pckg
    @illustrations = get_dir_entries("app/assets/images/pngs/illustration/" + @pckg)
    render 'extra', layout: 'without_menu'
  end

  # GET /illustrations/new
  def new
    @illustration = Illustration.new
  end

  # GET /illustrations/1/edit
  def edit
  end

  # POST /illustrations
  # POST /illustrations.json
  def create
    @illustration = Illustration.new(illustration_params)

    respond_to do |format|
      if @illustration.save
        format.html { redirect_to @illustration, notice: 'Illustration was successfully created.' }
        format.json { render :show, status: :created, location: @illustration }
      else
        format.html { render :new }
        format.json { render json: @illustration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /illustrations/1
  # PATCH/PUT /illustrations/1.json
  def update
    respond_to do |format|
      if @illustration.update(illustration_params)
        format.html { redirect_to @illustration, notice: 'Illustration was successfully updated.' }
        format.json { render :show, status: :ok, location: @illustration }
      else
        format.html { render :edit }
        format.json { render json: @illustration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /illustrations/1
  # DELETE /illustrations/1.json
  def destroy
    @illustration.destroy
    respond_to do |format|
      format.html { redirect_to illustrations_url, notice: 'Illustration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_illustration
    @illustration = Illustration.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def illustration_params
    params.require(:illustration).permit(:name)
  end
end
