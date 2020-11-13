# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://your-e-tan.com"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.


  add '/quiz', :changefreq => 'daily', :priority => 0.9
  add '/toeic', :changefreq => 'daily', :priority => 0.9
  add '/', :changefreq => 'daily', :priority => 0.9
  add '/novel', :changefreq => 'daily', :priority => 0.9
  add '/paper', :changefreq => 'daily', :priority => 0.9
  add '/type', :changefreq => 'daily', :priority => 0.9
  add '/select', :changefreq => 'daily', :priority => 0.9

  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
