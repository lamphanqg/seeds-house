class SeedsController < ApplicationController
  before_action :set_seed, only: [:edit, :update, :destroy]
  before_action :set_species, only: [:new, :edit, :create, :update]

  # GET /seeds
  def index
    @seeds = Seed.all
  end

  # GET /seeds/new
  def new
    @seed = Seed.new
  end

  # GET /seeds/1/edit
  def edit
  end

  # POST /seeds
  def create
    species_id = seed_params[:species_id]
    species = Species.find_by(id: species_id)
    @seed = species.seeds.build(seed_params)

    respond_to do |format|
      if @seed.save
        format.html { redirect_to seeds_url, notice: "Seed was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /seeds/1
  def update
    respond_to do |format|
      if @seed.update(seed_params)
        remove_images
        format.html { redirect_to edit_seed_url(@seed), notice: "Seed was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /seeds/1
  def destroy
    @seed.destroy
    respond_to do |format|
      format.html { redirect_to seeds_url, notice: "Seed was successfully destroyed." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_seed
    @seed = Seed.find(params[:id])
  end

  def set_species
    @species = Species.name_with_family_name
  end

  def remove_images
    [:image1, :image2, :image3].each do |image|
      @seed.send(image).purge if params[:"remove_#{image}"] == "true"
    end
  end

  # Only allow a list of trusted parameters through.
  def seed_params
    params.require(:seed)
          .permit(:name, :species_id, :image1, :image2, :image3)
  end
end
