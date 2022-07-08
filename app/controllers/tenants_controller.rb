class TenantsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index
        tenants = Tenant.all
        render json: tenants, status: :ok
    end

    def show
        tenant = tenant_id
        render json: tenant, status: :ok
    end

    def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :accepted
    end

    def destroy
        tenant = tenant_id
        tenant.destroy
    end

    private

    def tenant_id
        Tenant.find(params[:id])
    end

    def tenant_params
        params.permit(:name, :age)
    end

    def render_unprocessable_entity(invalid)
        render json:{error: invalid.record.errors}, status: :unprocessable_entity
    end

end
