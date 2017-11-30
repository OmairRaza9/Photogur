class PicturesController < ApplicationController
    def index
      #@pictures = Picture.all
      @most_recent_pictures = Picture.most_recent_five
      @older_than_one_month = Picture.created_before(Time.now - 1.month )
      @same_year = Picture.created_in(2017)
    end

    def show
      @picture = Picture.find(params[:id])
    end

    def new
      @picture = Picture.new
    end

    def create
    end

    def create
      render text: "Received POST request to '/pictures' with the data URL: #{params}"
    end

    def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]


    if @picture.save
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end
end
