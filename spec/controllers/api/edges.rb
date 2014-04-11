require 'spec_helper'

describe Api::EdgesController do
  describe "GET index" do
    it 'should respond with 200 status' do
      get 'index'
      expect(response.status).to eq(200)
    end

    it 'should respond with json' do
      category = Category.create(name: 'category')
      requirement = Requirement.create(name: 'req', value: 'val', mode: 'rank')
      edge = Edge.create({
        name: 'name',
        description: 'description',
        category: category,
        requirements: [ requirement ] 
      })
      get 'index'
      parsed = JSON.parse(response.body)
      expect(parsed[0]["category"]["name"]).to eq('category')
      expect(parsed[0]["requirements"][0]["name"]).to eq('req')      
    end
  end
end
