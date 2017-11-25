class RegistersController < ApplicationController
  before_action :set_register, only: [:show, :edit, :update, :destroy]

  # GET /registers
  # GET /registers.json
  def index
    @registers = Register.all
  end

  # GET /registers/1
  # GET /registers/1.json
  def show
  end

  # GET /registers/new
  def new
    @register = Register.new
  end

  # GET /registers/1/edit
  def edit
  end

  # POST /registers
  # POST /registers.json
  def create
    @register = Register.new(register_params)
    if @register.save
      redirect_to @register, notice: 'Register was successfully created.'
    else
      render :new 
    end
  end

  # PATCH/PUT /registers/1
  # PATCH/PUT /registers/1.json
  def update
    if @register.update(register_params)
      redirect_to @register, notice: 'Register was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /registers/1
  # DELETE /registers/1.json
  def destroy
    @register.destroy
    redirect_to registers_url, notice: 'Register was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register
      @register = Register.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_params
      params[:register][:number] = "#{params[:register][:number_1]}-#{params[:register][:number_2]}-#{params[:register][:number_3]}"
      3.times{ |i| params[:register].delete("number_#{i+1}".intern) }
      puts params
      params.require(:register).permit(:name, :number, :range, :time, :todo)
    end
end
