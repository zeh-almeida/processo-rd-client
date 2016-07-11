class VisitorsController < ApplicationController
  has_scope :by_email

  # GET /visitors
  # GET /visitors.json
  def index
    @visitors = apply_scopes(Visitor.all)
                       .select(:id, :email)
                       .order(:email, :id)
                       .page(params[:page])

    respond_with @visitors do |format|
      format.html do
        flash[:info] = I18n.t('simple_form.result', count: @visitors.count)
        redirect_to root_path
      end

      format.js
      format.json
    end
  end

  # GET /visitors/new
  # GET /visitors/1.json
  def new
    @visitor = Visitor.new
    respond_with @visitor do |format|
      format.html
      format.json
    end
  end

  # POST /visitors
  # POST /visitors.json
  def create
    send_visitor
    is_valid = (200..300).include?(@result.code)

    respond_with @visitor, status: is_valid ? :created : :unprocessable_entity do |format|
      format.html do
        if is_valid
          redirect_to root_path

        else
          render 'new'
        end
      end

      format.json{ render json: @visitor.to_json }
    end
  end

  private

    def visitor_params
      params.require(:visitor)
            .permit(:email, visitations_attributes: [ :id, :address, :visitor_id, :time])
    end

    def send_visitor
      @visitor = Visitor.new(visitor_params)

      body = { format: :json,
               visitor: visitor_params,
               api_key: ENV['COOKIE_API_KEY'] }

      @result = HTTParty.post(ENV['COOKIE_ENDPOINT'],
                              body: body.to_json,
                              headers: { 'Content-Type' => 'application/json' })
    end
end
