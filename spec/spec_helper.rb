require 'simplecov'
require 'simplecov-json'

SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter
SimpleCov.start

require 'kount'
require 'kount/request'
require 'kount/cart'
require 'kount/request/update'
require 'kount/request/inquiry'
require 'kount/utils/khash'
require 'kount/Response'