class ArtLetteringsController < ApplicationController

  include DefaultsAdding
  include ShowIndexesHelper

  before_action :set_art_lettering, only: [:show, :edit, :update, :destroy, :move_up, :move_down]

  def index
    ShowIndexesHelper.idealize_show_index(ArtLettering)
    @art_letterings = ArtLettering.order('show_index').reverse_order!
  end

  def show
  end

  def new
    @art_lettering = ArtLettering.new
  end

  def edit
  end

  def create
    @art_lettering = ArtLettering.new(art_lettering_params)

    if @art_lettering.save
      redirect_to @art_lettering, notice: 'Art lettering was successfully created.'
    else
      render :new
    end
  end

  def update
    if @art_lettering.update(art_lettering_params)
      redirect_to @art_lettering, notice: 'Art lettering was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @art_lettering.destroy
    redirect_to art_letterings_url, notice: 'Art lettering was successfully destroyed.'
  end


  def add_defaults
    DefaultsAdding.increase_all_indexes(ArtLettering)
    dir_with_letterings = DefaultsAdding::PNGS_PREFIX + 'Lettering/pc/'
    default_letterings = DefaultsAdding.get_paths_from_dir(dir_with_letterings)
    DefaultsAdding.create_plain_arts(ArtLettering, default_letterings)

    DefaultsAdding.increase_all_indexes(ArtLettering)
    dir_with_letterings = DefaultsAdding::PNGS_PREFIX + 'Lettering/hand/'
    default_letterings = DefaultsAdding.get_paths_from_dir(dir_with_letterings)
    DefaultsAdding.create_plain_arts(ArtLettering, default_letterings)

    redirect_to art_letterings_url, notice: 'Add default letterings.'
  end

  def clean
    ArtLettering.destroy_all
    redirect_to art_letterings_url, notice: 'Cleaned all.'
  end


  def move_up
    ShowIndexesHelper.move_up(@art_lettering)
    redirect_to art_letterings_url, notice: 'moves up'
  end

  def move_down
    ShowIndexesHelper.move_down(@art_lettering)
    redirect_to art_letterings_url, notice: 'moves down'
  end


  private
  def set_art_lettering
    @art_lettering = ArtLettering.find(params[:id])
  end

  def art_lettering_params
    params.require(:art_lettering).permit(:name, :show_index, :image)
  end
end
