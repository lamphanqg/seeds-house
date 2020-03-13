class SpeciesController < ApplicationController
  before_action :set_species, only: [:show, :edit, :update, :destroy]
  before_action :set_families, only: [:new, :edit, :create, :update]

  # GET /species
  # GET /species.json
  def index
    @species = Species.all
  end

  # GET /species/1
  def show
  end

  # GET /species/new
  def new
    @species = Species.new
  end

  # GET /species/1/edit
  def edit
    @species = Species.find_by(id: params[:id])
  end

  # POST /species
  def create
    family_id = species_params[:family_id]
    family = Family.find_by(id: family_id)
    @species = family.species.build(species_params)

    respond_to do |format|
      if @species.save
        format.html { redirect_to @species, notice: "Species was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /species/1
  def update
    respond_to do |format|
      if @species.update(species_params)
        format.html { redirect_to @species, notice: "Species was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /species/1
  def destroy
    @species.destroy
    respond_to do |format|
      format.html { redirect_to species_index_url, notice: "Species was successfully destroyed." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_species
    @species = Species.find(params[:id])
  end

  def set_families
    @families = Family.all
  end

  # Only allow a list of trusted parameters through.
  def species_params
    params.require(:species).permit(:name, :family_id)
  end
end
