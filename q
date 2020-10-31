
[1mFrom:[0m /home/vagrant/work/jphacks/kawaqiita/app/controllers/tops_controller.rb:57 TopsController#kakutan:

    [1;34m35[0m: [32mdef[0m [1;34mkakutan[0m
    [1;34m36[0m:   [1;34m# gon.words = Word.generate[0m
    [1;34m37[0m:   @results = [1;34;4mResult[0m.all.shuffle
    [1;34m38[0m:   @lines = [1;34;4mFileloader[0m.get_lines([1;34m0[0m)
    [1;34m39[0m:   [1;34m# @kakutanpdf = KakutanPdf.new(@result)[0m
    [1;34m40[0m:   [1;34m# @word_set = @kakutanpdf.contents(@result)[0m
    [1;34m41[0m:   [1;34m# binding.pry[0m
    [1;34m42[0m:   word_set = []
    [1;34m43[0m:   [32mfor[0m i [32min[0m [1;34m2[0m..@lines.last_row [32mdo[0m
    [1;34m44[0m:     word_set.push([@lines.row(i)[[1;34m1[0m], @lines.row(i)[[1;34m2[0m]])
    [1;34m45[0m:   [32mend[0m
    [1;34m46[0m:   @word_set = word_set
    [1;34m47[0m:   @num_min_table = [1;34m0[0m
    [1;34m48[0m:   @num_max_table = [1;34m24[0m
    [1;34m49[0m:   @num_min_pdf = [1;34m0[0m
    [1;34m50[0m:   @num_max_pdf = [1;34m24[0m
    [1;34m51[0m:   [32mif[0m params[[33m:select_num[0m] == [1;36mnil[0m
    [1;34m52[0m:     @select_num = [1;34m1[0m
    [1;34m53[0m:   [32melse[0m
    [1;34m54[0m:     @select_num = params[[33m:select_num[0m].to_i
    [1;34m55[0m:   [32mend[0m
    [1;34m56[0m:   binding.pry
 => [1;34m57[0m: [32mend[0m

