module Api
  module V1
    class Products < Grape::API
      resource :products do
        desc 'Returns all products'
        get do
          status :ok
        end
      end
    end
  end
end
