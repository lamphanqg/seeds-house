class FamiliesController < ApplicationController
  before_action :set_family, only: [:show, :edit, :update, :destroy]

  # GET /families
  def index
    @families = Family.all
  end

  # GET /families/1
  def show
  end

  # GET /families/new
  def new
    @family = Family.new
  end

  # GET /families/1/edit
  def edit
  end

  # POST /families
  def create
    @family = Family.new(family_params)

    respond_to do |format|
      if @family.save
        format.html { redirect_to @family, notice: "Family was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /families/1
  def update
    respond_to do |format|
      if @family.update(family_params)
        format.html { redirect_to @family, notice: "Family was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /families/1
  def destroy
    @family.destroy
    respond_to do |format|
      format.html { redirect_to families_url, notice: "Family was successfully destroyed." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_family
    @family = Family.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def family_params
    params.require(:family).permit(:name)
  end
end
