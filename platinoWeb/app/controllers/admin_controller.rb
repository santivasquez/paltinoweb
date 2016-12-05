class AdminController < ApplicationController
    include ApplicationHelper
  
  def autenticar
    parameters = login_params
    puts parameters
    if user = Usuario.find_by(correo: parameters[:inputEmail])
      if user.clave == parameters[:inputPassword]
        session[:user_id] = user.id
         redirect_to admin_inicio_url
      else
        flash[:error] = "Clave Incorrecta"
        redirect_to admin_login_url
      end

    else
      flash[:error] = "Datos incorrectos"
      redirect_to admin_login_url
    end
  end
 
    def login
    end

  def cerrar_sesion
    session.delete(:user_id)
    redirect_to admin_login_url
  end
    
    def inicio
       
    end
    
    

  def suscripcion
    NotificacionesMailer.suscribir(suscripcion_params[:email]).deliver_now
    flash[:success] = "Suscripción completa"
    redirect_to root_url
  end
  def contacto
    parameters = contacto_params
    nombre = parameters[:nombre]
    correo = parameters[:correo]
    tema = parameters[:tema]
    mensaje = parameters[:mensaje]
    NotificacionesMailer.contacto(correo,nombre,tema,mensaje).deliver_now
    flash[:success] = "Gracias, nos estaremos comunicando con usted"
    redirect_to store_contact_url 
  end  
  private 
  
  def login_params
    params.permit(:inputPassword, :inputEmail)
  end

 
  def suscripcion_params
    params.permit(:email)
  end

  def contacto_params
    params.permit(:nombre, :correo, :tema, :mensaje)
  end
end
