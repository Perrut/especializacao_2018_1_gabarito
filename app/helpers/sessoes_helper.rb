module SessoesHelper
  def log_in(usuario)
	  session[:usuario_id] = usuario.id
	  redirect_to usuario
	end
	
	def current_user
	  nil || Usuario.find_by(id: session[:usuario_id])
	end
	
	def logged_in?
	  !current_user.nil?
	end
	
	def log_out
	  session.delete(:usuario_id)
	  redirect_to login_path
	end
	
	def usuario_logado
	  if logged_in?
	    flash[:alert] = "Não permitido."
		  redirect_to current_user
	  end
	end
	
	def usuario_nao_logado
	  if !logged_in?
	    flash[:alert] = "Por favor faça login."
		  redirect_to login_path
	  end
	end
end
