
class Site
  include MongoMapper::Document

  key :url
  key :email

  timestamps!
end