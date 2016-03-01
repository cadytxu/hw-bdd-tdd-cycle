require 'rails_helper'
require 'spec_helper'

describe MoviesController do
  describe 'add director' do
    before :each do
      @m=double(Movie, :title => "Star Wars", :director => "director", :id => "1")
      Movie.stub(:find).with("1").and_return(@m)
    end
    it 'should call update_attributes and redirect' do
      #@m.stub(:update_attributes!).and_return(true)
      #put :update, {:id => "1", :movie => @m}
      #expect(response).to redirect_to(movie_path(@m))
    end
  end
  
  describe 'happy path' do
    before :each do
      @m=double(Movie, :title => "Star Wars", :director => "director", :id => "1")
      Movie.stub(:find).with("1").and_return(@m)
    end
    
    it 'should generate routing for Similar Movies' do
      #{ :post => same_director_path(1) }.
      #should route_to(:controller => "movies", :action => "similar_directors", :movie_id => "1")
    end
    it 'should call the model method that finds similar movies' do
      #fake_results = [double('Movie'), double('Movie')]
      #Movie.stub(:similar_directors).with('director').and_return(fake_results)
      #get :same_director, :movie_id => "1"
    end
    it 'should select the same_director template for rendering and make results available' do
      #Movie.stub(:similar_directors).with('director').and_return(@m)
      #get :same_director, :movie_id => "1"
      #expect(response).to render_template('same_director')
      #expect assigns(:movies).to eq(@m)
    end
  end
  
  describe 'sad path' do
    before :each do
      m=double(Movie, :title => "Star Wars", :director => nil, :id => "1")
      Movie.stub(:find).with("1").and_return(m)
    end
    
    it 'should generate routing for Similar Movies' do
      #{ :post => same_director_path(1) }.
      #should route_to(:controller => "movies", :action => "same_director", :movie_id => "1")
    end
    it 'should select the Index template for rendering and generate a flash' do
      #get :same_director, :movie_id => "1"
      #expect(response).to redirect_to(movies_path)
      #expect(flash[:notice]).to_not be_blank
    end
  end
  
  describe 'create and destroy' do
    it 'should create a new movie' do
      #MoviesController.stub(:create).and_return(mock('Movie'))
      #post :create, {:id => "1"}
    end
    it 'should destroy a movie' do
      m = double(Movie, :id => "10", :title => "Burning Bush", :director => nil)
      Movie.stub(:find).with("10").and_return(m)
      expect(m).to receive(:destroy)
      delete :destroy, {:id => "10"}
    end
  end
end