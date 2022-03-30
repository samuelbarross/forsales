class DiscountsController < ApplicationController
  before_action :set_discount, only: [:show, :edit, :update, :destroy]

  # GET /discounts
  def index
    # @search = Discount.search(params[:q])
    # @discounts = @search.result
    @discounts = Discount.all
  end

  # GET /discounts/1
  def show
  end

  # GET /discounts/new
  def new
    @discount = Discount.new
  end

  # GET /discounts/1/edit
  def edit
  end

  # POST /discounts
  def create
    @discount = Discount.new(discount_params)
    @discount.user = current_user

    if @discount.save
      redirect_to @discount, notice: 'Registro criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /discounts/1
  def update
    if @discount.update(discount_params)
      redirect_to @discount, notice: 'Registro atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /discounts/1
  def destroy
    @discount.destroy
    redirect_to discounts_url, notice: 'Registro removido com sucesso.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discount
      @discount = Discount.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def discount_params
      params.require(:discount).permit(:name, :description, :value, :kind, :status, :user_id)
    end
end
