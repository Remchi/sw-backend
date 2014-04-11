module Api
  class CategoriesController < ApplicationController
    def index
      render json: Category.all, root: false
    end
  end
end
