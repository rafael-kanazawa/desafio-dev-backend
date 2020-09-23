class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    render(status: :bad_request) && return if User.exists?(email: sign_up_params['email'])

    build_resource(sign_up_params)
    resource.save
    render_resource(resource)
  end

  # POST /resource
  def create
    build_resource(sign_up_params)

    if resource.save
      room = Room.find_by_title('chat')
      if room
        $redis.sadd("room:#{room.id}", resource.id)
        $redis.sadd("user:#{resource.id}", room.id)
      end
    end
    render_resource(resource)
    # super
  end

  # PUT /resource
  def update
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :role])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :role])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end