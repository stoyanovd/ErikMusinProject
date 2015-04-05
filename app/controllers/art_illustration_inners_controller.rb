class ArtIllustrationInnersController < ApplicationController

  include DefaultsAdding
  include ShowIndexesHelper

  before_action :set_art_illustration_inner, only: [:show, :edit, :update, :destroy, :move_up, :move_down]

  def index
    # ShowIndexesHelper.idealize_show_index(ArtIllustrationInner)
    @art_illustration_inners = ArtIllustrationInner.order('show_index').reverse_order!
  end

  def show
  end

  def new
    @art_illustration_inner = ArtIllustrationInner.new
  end

  def edit
  end

  def create
    @art_illustration_inner = ArtIllustrationInner.new(art_illustration_inner_params)

    if @art_illustration_inner.save
      redirect_to @art_illustration_inner, notice: 'Art illustration_inner was successfully created.'
    else
      render :new
    end
  end

  def update
    if @art_illustration_inner.update(art_illustration_inner_params)
      redirect_to @art_illustration_inner, notice: 'Art illustration_inner was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @art_illustration_inner.destroy
    redirect_to art_illustration_inners_url, notice: 'Art illustration_inner was successfully destroyed.'
  end


  def add_defaults
    # DefaultsAdding.increase_all_indexes(ArtIllustrationInner)
    # dir_with_illustration_inners = DefaultsAdding::PNGS_PREFIX + 'Illustration_inner'
    # default_illustration_inners = DefaultsAdding.get_paths_from_dir(dir_with_illustration_inners)
    # DefaultsAdding.create_plain_arts(ArtIllustrationInner, default_illustration_inners)

    redirect_to art_illustration_inners_url, notice: 'Add default illustration_inners.'
  end

  def clean
    ArtIllustrationInner.destroy_all
    redirect_to art_illustration_inners_url, notice: 'Cleaned all.'
  end


  def move_up
    ShowIndexesHelper.move_up(@art_illustration_inner, ArtIllustrationInner)
    redirect_to art_illustration_inners_url, notice: 'moves up'
  end

  def move_down
    ShowIndexesHelper.move_down(@art_illustration_inner, ArtIllustrationInner)
    redirect_to art_illustration_inners_url, notice: 'moves down'
  end


  private
  def set_art_illustration_inner
    @art_illustration_inner = ArtIllustrationInner.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def art_illustration_inner_params
    params.require(:art_illustration_inner_inner).permit(:show_index, :image, :art_illustration_inner_id)
  end
end
