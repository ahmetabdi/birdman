# Provides the implementation to handle collection of paginated resources.
# The collection of resources are cached locally, after going to next pages the previous pages do not make
# any request to obtain the resources again.
class Birdman::ApiPaginatedCollection
  RESOURCE_CLASS = nil

  attr_reader :total_pages, :total_results, :path, :params, :results_per_page

  def initialize(path, params={})
    self.path = path
    self.params = params
    self.params[:page] = 1
    self.params[:limit] = 10
    self.results_per_page = []
    get_results_per_page
  end

  # Returns a collection of resources for the current page
  def all
    get_results_per_page
  end

  # Request, fetch, cache and return the collection of resources for the next page.
  def next_page
    self.params[:page] += 1
    get_results_per_page
  end

  # Request, fetch, cache and return the collection of resources for the previous page.
  def previous_page
    raise ArgumentError.new("current_page must be greater than 0") if self.params[:page] == 1
    self.params[:page] -= 1
    get_results_per_page
  end

  # Returns current page number.
  def current_page
    self.params[:page]
  end

  # Request, fetch, cache and return the collection of resources for a given page number.
  def current_page=(page)
    self.params[:page] = page
    get_results_per_page
  end

  # Returns the first resource for of the current page.
  def first
    get_results_per_page.first
  end

  # Returns the last resource for of the current page.
  def last
    get_results_per_page.last
  end

private
  attr_writer :total_pages, :total_results, :path, :params, :results_per_page

  def fetch_colletion
    response = Birdman::Requester.get(path, params)
    self.class::RESOURCE_CLASS.build_collection(response)
  end

  def get_results_per_page
    self.results_per_page[current_page - 1] ||= fetch_colletion
  end
end
