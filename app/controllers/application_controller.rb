class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authenticate_user!
	def after_sign_in_path_for(resource)
  		#user_path(current_user) #your path
  		main_page_index_path
	end
	
	protected

	#def authenticate_user!
    	#if user_signed_in?
    	#	super
    	#else
      		#redirect_to new_user_session_path, :notice => 'if you want to add a notice'
      		## if you want render 404 page
      		## render :file => File.join(Rails.root, 'public/404'), :formats => [:html], :status => 404, :layout => false
    	
    	#end
  	
  	#end
end
