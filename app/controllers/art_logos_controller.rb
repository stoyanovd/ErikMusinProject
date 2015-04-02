class ArtLogosController < ApplicationController
  before_action :set_art_logo, only: [:show, :edit, :update, :destroy, :move_up, :move_down]

  # GET /art_logos
  # GET /art_logos.json
  def index
    idealize_show_index
    @art_logos = ArtLogo.order('show_index')
  end

  # GET /art_logos/1
  # GET /art_logos/1.json
  def show
  end

  # GET /art_logos/new
  def new
    @art_logo = ArtLogo.new
  end

  # GET /art_logos/1/edit
  def edit
  end

  # POST /art_logos
  # POST /art_logos.json
  def create
    @art_logo = ArtLogo.new(art_logo_params)

    respond_to do |format|
      if @art_logo.save
        format.html { redirect_to @art_logo, notice: 'Art logo was successfully created.' }
        format.json { render :show, status: :created, location: @art_logo }
      else
        format.html { render :new }
        format.json { render json: @art_logo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /art_logos/1
  # PATCH/PUT /art_logos/1.json
  def update
    respond_to do |format|
      if @art_logo.update(art_logo_params)
        format.html { redirect_to @art_logo, notice: 'Art logo was successfully updated.' }
        format.json { render :show, status: :ok, location: @art_logo }
      else
        format.html { render :edit }
        format.json { render json: @art_logo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /art_logos/1
  # DELETE /art_logos/1.json
  def destroy
    @art_logo.destroy
    respond_to do |format|
      format.html { redirect_to art_logos_url, notice: 'Art logo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_defaults

    ArtLogo.all.each { |art_logo|
      art_logo.show_index += 100
      art_logo.save
    }
    dir_with_logos = 'app/assets/images/pngs/logo/'
    default_logos = Dir[dir_with_logos + '*']
    i = 1
    default_logos.each { |image_path|
      puts 'i = ', i, ' ', image_path

      logo = ArtLogo.new
      logo.image = File.open(image_path)
      logo.name = File.basename(image_path, ".*")
      logo.show_index = i
      if logo.save
        puts 'success'
        i += 1
      else
        puts 'failure'
      end
    }
    puts("___\nWWWWW____\n____\n")
    puts(Dir[dir_with_logos + '*'])
    puts("___\n____\n____\n")

    # File.open('app/assets/images/pngs/logo')
    redirect_to art_logos_url, notice: 'Add default logos.'

  end

  def clean
    ArtLogo.destroy_all
    redirect_to art_logos_url, notice: 'Cleaned all.'
  end


  def move_up
    previous = get_previous
    if previous != nil
      x = previous.show_index
      previous.show_index = @art_logo.show_index
      @art_logo.show_index = x
      @art_logo.save
      previous.save
    end
    redirect_to art_logos_url, notice: 'moves up'
  end

  def move_down
    successive= get_successive
    if successive != nil
      x = successive.show_index
      successive.show_index = @art_logo.show_index
      @art_logo.show_index = x
      @art_logo.save
      successive.save
    end
    redirect_to art_logos_url, notice: 'moves down'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_art_logo
    @art_logo = ArtLogo.find(params[:id])
  end

  def get_previous
     ArtLogo.where('show_index < ?', @art_logo.show_index).order('show_index').last
  end
  def get_successive
     ArtLogo.where('show_index > ?', @art_logo.show_index).order('show_index').first
  end
  def idealize_show_index
    i = 1
    ArtLogo.order('show_index').each { |art_logo|
      art_logo.show_index = i
      art_logo.save
      i += 1
    }
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def art_logo_params
    params.require(:art_logo).permit(:name, :show_index, :image)
  end
end
