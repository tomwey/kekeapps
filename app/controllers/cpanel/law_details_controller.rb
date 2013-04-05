class Cpanel::LawDetailsController < Cpanel::ApplicationController
  before_filter :find_law_detail, only: [:show, :edit, :update, :destroy]
  def index
    @law_details = LawDetail.includes(:law_category, :app_info)
                            .where(:visible => true)
                            .sorted.paginate(page: params[:page], per_page: 5)
                            
    fresh_when etag: [@law_details.first, current_user],
               last_modified: @law_details.first.created_at
  end

  def show
    fresh_when etag: [@law_detail, current_user],
               last_modified: @law_detail.created_at
    
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
