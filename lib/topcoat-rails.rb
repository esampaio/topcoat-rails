require 'rails'
require "topcoat-rails/version"

module Topcoat
  module Rails
    if ::Rails.version < '3.1'
      require 'topcoat-rails/railtie'
    else
      require 'topcoat-rails/engine'
    end
  end
end
