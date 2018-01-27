class SessoesController < ApplicationController
  before_action :usuario_logado, only: [:new, :create]
  
  def new
  end
  
  def create
    usuario = Usuario.find_by(email: params[:sessao][:email])
    if usuario && usuario.authenticate(params[:sessao][:password])
      log_in usuario
    else
      flash.now[:alert] = "Usuário ou senha incorretos."
      render "new"
    end
  end
  
  def destroy
    log_out
  end
end
