class ArticulosController < ApplicationController
  include VentasHelper
  before_action :set_articulo, only: [:show, :edit, :update, :destroy]
  helper_method :clave_format
  # GET /articulos
  # GET /articulos.json
  def index
    @articulos = Articulo.all
    @articulos = Articulo.paginate(:page => params[:page])
    if params[:term].present?
      @articulos    = @articulos.where("descripcion LIKE ? ", "%#{params[:term]}%")
      configuracion = Configuracion.find(1);
      articulosAux  = []
      @articulos.each do |articulo|
        articuloAux = agregarAtributosConfiguracion articulo, configuracion
        articulosAux.push(articuloAux)
      end
      @articulos = articulosAux
      #m
    else
      @articulos = @articulos.paginate(page: params[:page])
    end

    respond_to do |format|
      format.html
      format.json { render :json => @articulos }
    end
  end

  # GET /articulos/1
  # GET /articulos/1.json
  def show
    @disabled = true
    @clave = clave_format(params[:id])
  end

  # GET /articulos/new
  def new
    @disabled = false
    @clave = clave_format(Articulo.maximum(:id).to_i.next)
    @button_lavel = "Guardar"
    @articulo = Articulo.new
  end

  # GET /articulos/1/edit
  def edit
    @disabled = false
    @button_lavel = "Editar"
    @clave = clave_format(params[:id])
  end

  # POST /articulos
  # POST /articulos.json
  def create
    @button_lavel = "Guardar"
    @clave = clave_format(Articulo.maximum(:id).to_i.next)
    @articulo = Articulo.new(articulo_params)
    respond_to do |format|
      if @articulo.save
        format.html { redirect_to articulos_path, notice: 'Bien Hecho. El articulo ha sido registrado correctamente' }
        format.json { render :show, status: :created, location: @articulo }
      else
        format.html { render :new }
        format.json { render json: @articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articulos/1
  # PATCH/PUT /articulos/1.json
  def update
    respond_to do |format|
      if @articulo.update(articulo_params)
        format.html { redirect_to articulos_path, notice: 'Se actualizó el articulo correctamete.' }
        format.json { render :show, status: :ok, location: @articulo }
      else
        format.html { render :edit }
        format.json { render json: @articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articulos/1
  # DELETE /articulos/1.json
  def destroy
    @articulo.destroy
    respond_to do |format|
      format.html { redirect_to articulos_url, notice: 'Se eliminó el articulo correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_articulo
      @articulo        = Articulo.find(params[:id])
      @articulo.precio = sprintf("%.2f", @articulo.precio)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def articulo_params
      params.require(:articulo).permit(:descripcion, :modelo, :precio, :existencia)
    end
end
