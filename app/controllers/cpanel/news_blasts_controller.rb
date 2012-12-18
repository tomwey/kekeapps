class Cpanel::NewsBlastsController < Cpanel::ApplicationController
  # GET /app_infos
  # GET /app_infos.json
  def index
    @news_blasts = NewsBlast.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @news_blasts }
    end
  end

  # GET /app_infos/1
  # GET /app_infos/1.json
  def show
    @news_blast = NewsBlast.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @news_blast }
    end
  end

  # GET /app_infos/new
  # GET /app_infos/new.json
  def new
    @news_blast = NewsBlast.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @news_blast }
    end
  end

  # GET /app_infos/1/edit
  def edit
    @news_blast = NewsBlast.find(params[:id])
  end

  # POST /app_infos
  # POST /app_infos.json
  def create
    @news_blast = NewsBlast.new(params[:news_blast])

    respond_to do |format|
      if @news_blast.save
        format.html { redirect_to cpanel_news_blasts_path, notice: 'Newsblast was successfully created.' }
        format.json { render json: @news_blast, status: :created, location: @news_blast }
      else
        format.html { render action: "new" }
        format.json { render json: @news_blast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /app_infos/1
  # PUT /app_infos/1.json
  def update
    @news_blast = NewsBlast.find(params[:id])

    respond_to do |format|
      if @news_blast.update_attributes(params[:newsblast])
        format.html { redirect_to cpanel_news_blasts_path, notice: 'Newsblast was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @news_blast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_infos/1
  # DELETE /app_infos/1.json
  def destroy
    @news_blast = NewsBlast.find(params[:id])
    @news_blast.destroy

    respond_to do |format|
      format.html { redirect_to cpanel_news_blasts_url }
      format.json { head :no_content }
    end
  end
  
end
