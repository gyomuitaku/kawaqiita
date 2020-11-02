class TmpsController < ApplicationController
  before_action :set_tmp, only: [:show, :edit, :update, :destroy]

  # GET /tmps
  # GET /tmps.json
  def index
    @tmps = Tmp.all
  end

  # GET /tmps/1
  # GET /tmps/1.json
  def show
  end

  # GET /tmps/new
  def new
    @tmp = Tmp.new
  end

  # GET /tmps/1/edit
  def edit
  end

  # POST /tmps
  # POST /tmps.json
  def create
    @tmp = Tmp.new(tmp_params)

    respond_to do |format|
      if @tmp.save
        format.html { redirect_to @tmp, notice: 'Tmp was successfully created.' }
        format.json { render :show, status: :created, location: @tmp }
      else
        format.html { render :new }
        format.json { render json: @tmp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tmps/1
  # PATCH/PUT /tmps/1.json
  def update
    respond_to do |format|
      if @tmp.update(tmp_params)
        format.html { redirect_to @tmp, notice: 'Tmp was successfully updated.' }
        format.json { render :show, status: :ok, location: @tmp }
      else
        format.html { render :edit }
        format.json { render json: @tmp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tmps/1
  # DELETE /tmps/1.json
  def destroy
    @tmp.destroy
    respond_to do |format|
      format.html { redirect_to tmps_url, notice: 'Tmp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tmp
      @tmp = Tmp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tmp_params
      params.require(:tmp).permit(:name, :age)
    end
end
