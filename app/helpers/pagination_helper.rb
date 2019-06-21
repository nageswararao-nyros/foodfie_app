module PaginationHelper
  DEFAULT_PAGE = 1
  DEFAULT_LIMIT = 20
  MAXIMUM_LIMIT = 50

  def self.included(base)
    unless base.const_defined?(:DEFAULT_LIMIT)
      base.const_set :DEFAULT_LIMIT, PaginationHelper::DEFAULT_LIMIT
    end
  end

  def page
    page_params[:page].present? ? page_params[:page].to_i : self.class.const_get(:DEFAULT_PAGE)
  end

  def limit
    page_params[:limit].present? ? [page_params[:limit].to_i, self.class.const_get(:MAXIMUM_LIMIT)].min : self.class.const_get(:DEFAULT_LIMIT)
  end

  def page_params
    params.permit :limit, :page
  end
end