class KakutanPdf < Prawn::Document

	# recordにモデルなどのデータを渡します
	def initialize(result)

	  # superで初期設定を指定します(ページサイズ、マージン等)
	  super(
	    page_size: 'A4',
	    top_margin: 40,
	    bottom_margin: 30,
	    left_margin: 20,
	    right_margin: 20
	  )

	  font 'app/assets/fonts/ipaexm.ttf' # fontをパスで指定

	  # stroke_axis

	  @result = result # インスタンスを受け取り。コンポーネント作成時などにレコード内のデータを使える

	  header
	  contents

	end

	def header
		text 'カクタン', size: 20
	    move_down 20
	end

	def contents
		data = []
		binding.pry
		for i in 1..50 do
			data.push([@result.word, @result.meaning])
		end
		table data
	end

end