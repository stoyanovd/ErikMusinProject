class ArtIllustrationsController < ApplicationController

  include DefaultsAdding
  include ShowIndexesHelper

  before_action :set_art_illustration, only: [:show, :edit, :update, :destroy, :move_up, :move_down]

  def index
    ShowIndexesHelper.idealize_show_index(ArtIllustration)
    @art_illustrations = ArtIllustration.order('show_index').reverse_order!
  end

  def show
  end

  def new
    @art_illustration = ArtIllustration.new
  end

  def edit
  end

  def create
    @art_illustration = ArtIllustration.new(art_illustration_params)

    if @art_illustration.save
      redirect_to @art_illustration, notice: 'Art illustration was successfully created.'
    else
      render :new
    end
  end

  def update
    if @art_illustration.update(art_illustration_params)
      redirect_to @art_illustration, notice: 'Art illustration was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @art_illustration.destroy
    redirect_to art_illustrations_url, notice: 'Art illustration was successfully destroyed.'
  end


  def add_defaults
    DefaultsAdding.increase_all_indexes(ArtIllustration)
    dir_with_illustrations = DefaultsAdding::PNGS_PREFIX + 'illustration/'
    default_illustrations = DefaultsAdding.get_paths_from_dir(dir_with_illustrations)
    DefaultsAdding.create_illustrations(default_illustrations)

    redirect_to art_illustrations_url, notice: 'Add default illustrations.'
  end

  def clean
    ArtIllustration.destroy_all
    redirect_to art_illustrations_url, notice: 'Cleaned all.'
  end


  def move_up
    ShowIndexesHelper.move_up(@art_illustration, ArtIllustration)
    redirect_to art_illustrations_url, notice: 'moves up'
  end

  def move_down
    ShowIndexesHelper.move_down(@art_illustration, ArtIllustration)
    @art_illustration.
    redirect_to art_illustrations_url, notice: 'moves down'
  end


  private
  def set_art_illustration
    @art_illustration = ArtIllustration.find(params[:id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def art_illustration_params
    params.require(:art_illustration).permit(:name, :show_index, :back_color, :image,
                                             art_illustration_inners_attributes: [:id, :show_index, :image, :_destroy])
  end
end
