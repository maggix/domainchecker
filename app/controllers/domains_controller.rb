class DomainsController < ApplicationController
  before_action :set_domain, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @domains = current_user.domains
    respond_with(@domains)
  end

  def show
    respond_with(@domain)
  end

  def new
    @domain = Domain.new
    respond_with(@domain)
  end

  def edit
  end

  def create
    @domain = Domain.new(domain_params)
    @domain.user = current_user
    @domain.save
    # respond_with(@domain)
    redirect_to action: "index"
  end

  def update
    @domain.update(domain_params)
    respond_with(@domain)
  end

  def destroy
    @domain.destroy
    respond_with(@domain)
  end

  private
    def set_domain
      @domain = Domain.find(params[:id])
    end

    def domain_params
      params.require(:domain).permit(:host, :user_id, :expiration_date)
    end
end
