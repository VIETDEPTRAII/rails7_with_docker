module ApiDefault
  extend ActiveSupport::Concern

  included do
    prefix 'api'
    version 'v1', using: :path
    default_format :json
    format :json

    rescue_from ActiveRecord::RecordNotFound do |error|
      error!({ message: 'Record not found', error_message: error&.message },
             404)
    end

    rescue_from ActiveRecord::RecordInvalid,
                ActiveModel::ValidationError,
                Grape::Exceptions::ValidationErrors do |error|
      error!({ message: 'Bad Request', error_message: error&.message }, 400)
    end

    rescue_from StandardError do |e|
      Rails.logger.debug e
      error!({ message: 'Internal Server Error' }, 500)
    end
  end
end
