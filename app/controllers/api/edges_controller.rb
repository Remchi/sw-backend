module Api
  class EdgesController < ApplicationController
    before_filter :authenticate_user_from_token!, except: [ :index ]
    
    def index
      render json: Edge.all, root: false
    end

    def create
      rank = Requirement.create({ mode: 'rank', value: params["rank"]["name"]})
      
      edge = Edge.new
      edge.name = params["name"]
      edge.description = params["description"]
      edge.category_id = params["category"]["id"]
      edge.requirements = [ rank ]
      edge.save

      render json: edge, root: false
    end

    def update
      edge = Edge.find(params[:id])
      edge.name = params["name"]
      edge.description = params["description"]
      edge.category_id = params["category"]["id"]
      edge.save

      rank = edge.requirements.first
      rank.value = params["rank"]["name"]
      rank.save

      render json: edge, root: false
    end

    def destroy
      edge = Edge.find(params[:id])
      edge.delete
      render json: {}
    end
  end
end
