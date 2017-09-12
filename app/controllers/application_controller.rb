class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  #
	#before_action :authenticate_user!
  #
  helper_method :isConfigurated?
	def after_sign_in_path_for(resource)
  		#user_path(current_user) #your path
  		main_page_index_path
	end
  #si es el valor del id, es menor a mil, etnonces le pondra ceros a la izquierda
  def clave_format(id)
    if id.to_s.length == 1
      return "000#{id}"
    end
    if id.to_s.length == 2
      return "00#{id}"
    end
    if id.to_s.length == 2
      return "0#{id}"
    end
    id
  end

  def isConfigurated?
    return !Configuracion.all.empty?
  end


  def is_number? string
      true if Float(string) rescue false
  end

	protected
  
end
