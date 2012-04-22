module DataNasaHelper
  include HttpHelper

  API_DATA_URL = 'http://data.nasa.gov/api'.freeze

  POST_MAPPINGS = {
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

  CUSTOM_FIELD_MAPPINGS = {
    'acronym' => 'acronym',
    'more_info_link' => 'more_info_link',
    'datagov_id' => 'datagov_id'
  }.freeze

  CURATOR_MAPPINGS = {
    'curator_person_name' => 'person_name',
    'curator_person_email' => 'person_email',
    'curator_url' => 'url',
    'curator_center' => 'center',
    'curator_org_name' => 'org'
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
      p = Hash[post.map {|k, v| [POST_MAPPINGS[k.to_s].to_sym, v] unless POST_MAPPINGS[k.to_s].nil? || v.to_s.empty? }]
      p[:title] = HttpHelper.extract_text_from_html p[:title]
      p[:content] = HttpHelper.extract_text_from_html p[:content]

      cf = Hash[post['custom_fields'].map {|k, v| [CUSTOM_FIELD_MAPPINGS[k.to_s].to_sym, v] unless !CUSTOM_FIELD_MAPPINGS.include?(k.to_s) || CUSTOM_FIELD_MAPPINGS[k.to_s].nil? || v.to_s.empty? }]

      # convert custom_fields to top level items
      p.merge!(cf)
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

    def extract_curator_hash(post)
      Hash[post['custom_fields'].map {|k, v| [CURATOR_MAPPINGS[k.to_s].to_sym, v.to_s] unless !CURATOR_MAPPINGS.include?(k.to_s) || v.to_s.empty? }]
    end

  end
end