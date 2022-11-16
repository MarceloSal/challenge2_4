class AdminsBackoffice::CitizensController < AdminsBackofficeController
  
    
    before_action :set_citizen, only: [:edit, :update, :destroy]
    
  
    def index
      @citizens = Citizen.all
    end
  
    def new
      @citizen = Citizen.new
    end
  
    def create
      @citizen = Citizen.new(params_citizen)
      if @citizen.save
        redirect_to admins_backoffice_citizens_path, notice: 'Municipe cadastrado com sucesso'
      else 
        render :edit
      end
    end
  
    def edit
      #@admin = Admin.find(params[:id])
    end
  
    def update
      #@admin = Admin.find(params[:id])
      #params_admin = 
  
      if @citizen.update(params_citizen)
        redirect_to admins_backoffice_citizens_path, notice: 'Municipe atualizado com sucesso'
      else 
        render :edit
      end
    end
  
    def destroy
      if @citizen.destroy
        redirect_to admins_backoffice_citizens_path, notice: 'Municipe excluído com sucesso'
      else 
        render :index
      end
    end
    
    private
  
    def params_citizen
      params.require(:citizen).permit(:first_name, :last_name, :cpf, :cns, :email, :birthday, :phone, :status)
    end
  
    def set_citizen
      @citizen = Citizen.find(params[:id])
    end
end

  
