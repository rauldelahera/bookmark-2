require 'pg'

class Bookmark
  attr_reader :id, :title, :url
  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end

    rs = con.exec 'SELECT * FROM bookmarks'
    rs.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(url:, title:)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect(dbname: 'bookmark_manager_test')
    else
      con = PG.connect(dbname: 'bookmark_manager')
    end
    result = con.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title"
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end


end
