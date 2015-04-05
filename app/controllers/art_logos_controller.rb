class ArtLogosController < ApplicationController

  include DefaultsAdding
  include ShowIndexesHelper

  before_action :set_art_logo, only: [:show, :edit, :update, :destroy, :move_up, :move_down]

  def index
    ShowIndexesHelper.idealize_show_index(ArtLogo)
    @art_logos = ArtLogo.order('show_index').reverse_order!
  end

  def show
  end

  def new
    @art_logo = ArtLogo.new
  end

  def edit
  end

  def create
    @art_logo = ArtLogo.new(art_logo_params)

    if @art_logo.save
      redirect_to @art_logo, notice: 'Art logo was successfully created.'
    else
      render :new
    end
  end

  def update
    if @art_logo.update(art_logo_params)
      redirect_to @art_logo, notice: 'Art logo was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @art_logo.destroy
    redirect_to art_logos_url, notice: 'Art logo was successfully destroyed.'
  end


  def add_defaults
    DefaultsAdding.increase_all_indexes(ArtLogo)
    dir_with_logos = DefaultsAdding::PNGS_PREFIX + 'logo/'
    default_logos = DefaultsAdding.get_paths_from_dir(dir_with_logos)
    DefaultsAdding.create_plain_arts(ArtLogo, default_logos)

    redirect_to art_logos_url, notice: 'Add default logos.'
  end

  def clean
    ArtLogo.destroy_all
    redirect_to art_logos_url, notice: 'Cleaned all.'
  end


  def move_up
    ShowIndexesHelper.move_up(@art_logo, ArtLogo)
    redirect_to art_logos_url, notice: 'moves up'
  end

  def move_down
    ShowIndexesHelper.move_down(@art_logo, ArtLogo)
    redirect_to art_logos_url, notice: 'moves down'
  end


  private
  def set_art_logo
    @art_logo = ArtLogo.find(params[:id])
  end

  def art_logo_params
    params.require(:art_logo).permit(:name, :show_index, :image)
  end
end
