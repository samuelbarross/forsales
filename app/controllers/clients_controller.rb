class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  def index
    # @search = Client.search(params[:q])
    # @clients = @search.result
    @clients = Client.all
  end

  # GET /clients/1
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
    @client.status = :active
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  def create
    @client = Client.new(client_params)
    @client.user = current_user

    if @client.save
      redirect_to @client, notice: 'Registro criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Registro atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
    redirect_to clients_url, notice: 'Registro removido com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params.require(:client).permit(:name, :email, :birth_date, :phone, :user_id, :status, :country, :city, :state, :neighborhood, :street, :number)
    end
end
