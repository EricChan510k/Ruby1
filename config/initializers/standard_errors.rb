# Webapp errors
class BestOfYearAwards::Unauthorized < StandardError; end
class BestOfYearAwards::ActionTimeout < StandardError; end
class BestOfYearAwards::ExpiredListing < StandardError; end