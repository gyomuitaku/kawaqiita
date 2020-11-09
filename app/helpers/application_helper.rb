module ApplicationHelper
    def default_meta_tags
        {
          site: 'Eーtan',
          title: '無料英単語学習・暗記サイト',
          reverse: true,
          separator: '|',
          description: 'E-tanは無料で英単語を簡単に暗記するためのサイトです。４択クイズ、辞書、その他の学習ツールを使って、今日から学習を始めましょう…すべて無料です。',
          keywords: '',
          canonical: request.original_url,
          noindex: ! Rails.env.production?,
          icon: [
            { href: image_url('favicon.ico') },
            { href: image_url('icon.jpg'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
          ],
          og: {
            site_name: 'E-tan',
            title: '無料英単語学習・暗記サイト',
            description: 'E-tanは無料で英単語を簡単に暗記するためのサイトです。４択クイズ、辞書、その他の学習ツールを使って、今日から学習を始めましょう…すべて無料です。',
            type: 'website',
            url: request.original_url,
            image: image_url('ogp.png'),
            locale: 'ja_JP',
          },
        }
      end
end
