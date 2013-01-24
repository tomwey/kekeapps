class Cpanel::LawDetailsController < Cpanel::ApplicationController
  before_filter :find_law_detail, only: [:show, :edit, :update, :destroy]
  def index
    @law_details = LawDetail.includes(:law_category, :app_info)
                            .where(:visible => true)
                            .sorted
  end

  def show
    
  end

  def new
    @categories = LawCategory.all
    @law_detail = LawDetail.new
  end

  def create
    @law_detail = LawDetail.new(params[:law_detail])
    if @law_detail.save
      redirect_to [:cpanel, @law_detail], notice: 'Law data was successfully created.'
    else
      render action: "new"
    end
  end

  def edit
    @categories = LawCategory.all
  end

  def update
    if @law_detail.update_attributes(params[:law_detail])
      redirect_to [:cpanel, @law_detail], notice: 'Law data was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @law_detail.visible = false
    @law_detail.save!
    redirect_to cpanel_law_details_url
  end
  
  private
  def find_law_detail
    @law_detail = LawDetail.find(params[:id])
  end
  
end
