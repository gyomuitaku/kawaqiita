class KakutanPdfsController < ApplicationController
  def index
    data = []
    for i in 0..299 do
      data.push([params[:word_set][:words][i][:english_first], params[:word_set][:words][i][:japanese_first], params[:word_set][:words][i][:english_second], params[:word_set][:words][i][:japanese_second]])
    end

    @results = data
    @page = params[:page].to_i
    # binding.pry
    respond_to do |format|
      format.html
      format.pdf do

        # pdfを新規作成。インスタンスを渡す。
        pdf = KakutanPdf.new(@results, @page)

        send_data pdf.render,
          filename:    "sample.pdf",
          type:        "application/pdf",
          disposition: "inline" # 画面に表示。外すとダウンロードされる。
      end
    end
  end
end
