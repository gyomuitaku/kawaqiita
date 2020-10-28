class KakutanPdf < Prawn::Document

	# recordにモデルなどのデータを渡します
	def initialize(result)

	  # superで初期設定を指定します(ページサイズ、マージン等)
	  super(
	    page_size: 'A4',
	    top_margin: 80,
	    bottom_margin: 30,
	    left_margin: 57,
	  )

	  font 'app/assets/fonts/ipaexm.ttf' # fontをパスで指定

	  # stroke_axis

	  @result = result # インスタンスを受け取り。コンポーネント作成時などにレコード内のデータを使える

	  header
	  contents

	end

	def header
		draw_text 'カクタン', at: [183, 755], size: 30
	end

	def contents
		data = []
		# binding.pry
		for i in 1..25 do
			data.push([@result.find(i).word, @result.find(i).meaning, @result.find(i+25).word, @result.find(i+25).meaning])
		end
		data_shuffle = data.shuffle
		data_shuffle.unshift(["英語", "日本語", "英語", "日本語"])
		table data_shuffle, cell_style: { size: 10, height: 28, width: 120 , padding_top: 8, padding_left: 7 }, header: true do |t|
	      t.before_rendering_page do |page|
	        page.row(0).border_bottom_width = 3
	      end
	    end
	end

end