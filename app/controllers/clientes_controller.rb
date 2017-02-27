class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]
  helper_method :clave_format
  # GET /clientes
  # GET /clientes.json
  def index
    #@clientes = Cliente.all
    @clientes = Cliente.paginate(:page => params[:page])
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @clave = clave_format(Cliente.maximum(:id).to_i.next)
    @button_lavel = "Guardar"
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
    @button_lavel = "Editar"
    @clave = clave_format(params[:id])
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @button_lavel = "Guardar"
    @clave = clave_format(Cliente.maximum(:id).to_i.next)
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: 'Cliente was successfully created.' }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: 'Cliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to clientes_url, notice: 'Cliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def clave_agergar
    clave_format(Cliente.maximum(:id).to_i.next)
  end

  def clave_editar

  end

  def clave_format(id)
    if id.to_s.length == 1
      return "000#{id}"
    end
    if idto_s.length == 2
      return "00#{id}"
    end
    if idto_s.length == 2
      return "0#{id}"
    end
    id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:nom_cliente, :ap_paterno, :ap_materno, :rfc)
    end
end
