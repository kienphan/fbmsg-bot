class Sickness < ActiveRecord::Base

  fuzzily_searchable :title

  SEARCH_TITLE_LIMIT = 5

  def self.search(text)
    self.find_by_fuzzy_title(text, limit: SEARCH_TITLE_LIMIT)
  end
end
