require_dependency "demo_rails_engine/application_controller"

module DemoRailsEngine
  class OrdersController < ApplicationController
    layout 'demo_rails_engine/layouts/application'
    before_action :set_order, only: [:show, :edit, :update, :destroy]

    # GET /orders
    def index
      @orders = DemoRailsEngine::Order.all
    end

    # GET /orders/1
    def show
    end

    # GET /orders/new
    def new
      @order = Order.new
    end

    # GET /orders/1/edit
    def edit
    end

    # POST /orders
    def create
      @order = Order.new(order_params)
      @order.user = current_user

      if @order.save
        redirect_to @order, notice: 'Order was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /orders/1
    def update
      if @order.update(order_params)
        redirect_to @order, notice: 'Order was successfully updated.'
      else
        render :edit
      end
    end

    def download_file
      order = Order.find(params[:id])
      file = order.file 
      send_file file.path, filename: file.original_filename
    end
    
    # DELETE /orders/1total_price

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_order
        @order = Order.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def order_params
        params.require(:order).permit(:number, :status, :total_price, :product_id)
      end
  end
end
