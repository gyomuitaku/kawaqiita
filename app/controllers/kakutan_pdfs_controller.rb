class KakutanPdfsController < ApplicationController
  def index
    data = []
    @page = params[:select_num].to_i
    # binding.pry
    for i in 0..@page*25-1 do
      data.push([params[:word_set][:words][i][:english_first], params[:word_set][:words][i][:japanese_first], params[:word_set][:words][i][:english_second], params[:word_set][:words][i][:japanese_second]])
    end

    @results = data
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
