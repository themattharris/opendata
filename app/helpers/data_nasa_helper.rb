module DataNasaHelper
  include HttpHelper

  API_DATA_URL = 'http://data.nasa.gov/api'.freeze

  MAPPINGS = {
    'modified' => 'updated_at',
    'title_plain' => 'title',
    'excerpt' => nil,
    'slug' => nil,
    'content' => 'content',
    'url' => 'url',
    'id' => 'remote_id',
    'custom_fields' => nil,
    'date' => 'created_at',
    'title' => nil,
    'tags' => nil,
    'categories' => nil,
  }.freeze

  class << self
    def fetch_all(count=50, page=1)
      response = HttpHelper.make_request("#{API_DATA_URL}/get_recent_datasets/", { :count => count, :page => page })
      return [] unless response.code == 200

      data = ActiveSupport::JSON.decode(response.body)
      if data['pages'] && data['pages'] > page
        posts = self.fetch_all(count, page+1)
        if !posts['posts'].empty?
          data['posts']+=posts['posts']
          data['count']+=posts['count']
        end
      end
      data
    end

    def fetch_one(id)
      response = HttpHelper.make_request("#{API_DATA_URL}/get_dataset/", { :id => id })
      return unless response.code == 200

      ActiveSupport::JSON.decode(response.body)
    end

    def to_data_source_hash(post)
      p = Hash[post.map {|k, v| [MAPPINGS[k.to_s].to_sym, v] unless MAPPINGS[k.to_s].nil? }]
      p[:title] = HttpHelper.extract_text_from_html p[:title]
      p[:content] = HttpHelper.extract_text_from_html p[:content]

      # convert custom_fields to top level items
      p.merge!(Hash[post['custom_fields'].map {|k, v| [k.to_sym, v.first] }])
    end

    def extract_tags_hash(post)
      tags = []
      post['tags'].each do |t|
        tags << { :slug => t['slug'], :title => t['title'] }
      end
      tags
    end

    def extract_categories_hash(post)
      categories = []
      post['categories'].each do |t|
        categories << { :slug => t['slug'], :title => t['title'] }
      end
      categories
    end

  end
end