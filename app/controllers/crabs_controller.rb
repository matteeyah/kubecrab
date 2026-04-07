class CrabsController < ApplicationController
  before_action :set_crab, only: %i[show destroy restart upgrade]

  def index
    @crabs = authorize(policy_scope(Crab))
  end

  def show; end

  def new
    @crab = Crab.new
    @crab.template_id = params[:template_id]
    authorize(@crab)
  end

  def create
    @crab = Crab.new(permitted_attributes(Crab))
    @crab.user = current_user
    authorize(@crab)

    respond_to do |format|
      if @crab.save
        format.html { redirect_to crabs_path, notice: "Crab has been created." }
      else
        format.html { render :new, status: :unprocessable_content }
      end
    end
  end

  def destroy
    @crab.destroy!
    redirect_to crabs_path, notice: "Crab has been deleted."
  end

  def restart
    redirect_to crab_path(@crab), notice: "Crab is scheduled for restart."
  end

  def upgrade
    redirect_to crab_path(@crab), notice: "Crab is scheduled for upgrade."
  end

  private

  def set_crab
    @crab = Crab.find(params[:id])
    authorize @crab
  end
end
