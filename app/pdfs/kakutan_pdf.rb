class KakutanPdf < Prawn::Document

	# recordにモデルなどのデータを渡します
	def initialize(result, page)

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
	  @page = page

	  header
	  contents

	end

	def header
		draw_text 'カクタン', at: [183, 755], size: 30
	end

	def contents
		data = []
		# binding.pry
		min = 0
		max = 24
		for i in 1..@page do
			for j in min..max do
				data.push([@result[j][0], @result[j][1], @result[j][2], @result[j][3]])
			end
			for j in min..max do
				data.push([@result[j][0], "", @result[j][2], ""])
			end
			min += 25
			max += 25
		end
		data.unshift(["英語", "日本語", "英語", "日本語"])
		table data, header: true, cell_style: { size: 10, height: 28, width: 120 , padding_top: 8, padding_left: 7 }, header: true do |t|
	      t.before_rendering_page do |page|
	        page.row(0).border_bottom_width = 3
	      end
	    end
	end

end