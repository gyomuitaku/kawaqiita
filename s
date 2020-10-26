
[1mFrom:[0m /home/vagrant/work/kawaqiita/app/libs/quiz.rb:14 Quiz.generate:

     [1;34m9[0m: [32mdef[0m [1;36mself[0m.[1;34mgenerate[0m(s,e)
    [1;34m10[0m:     questions, i = [], [1;34m0[0m,
    [1;34m11[0m:     xlsx = [1;34;4mFileloader[0m.get_lines
    [1;34m12[0m:     xlsx_choice = (s..e).to_a.sample([1;34m100[0m)
    [1;34m13[0m:     binding.pry
 => [1;34m14[0m:     [32mfor[0m row [32min[0m [1;34m1[0m..[1;34m100[0m [32mdo[0m
    [1;34m15[0m:         [1;34m# 98なのは+1したときにindexがオーバーしないようにする[0m
    [1;34m16[0m:         choice_array = [1;34;4mArray[0m.new([1;34m3[0m){ rand [1;34m2000[0m }
    [1;34m17[0m:         item = []
    [1;34m18[0m:         item.push(xlsx.row(xlsx_choice[row]))
    [1;34m19[0m:         [32mfor[0m j [32min[0m choice_array [32mdo[0m
    [1;34m20[0m:             [32mif[0m j != xlsx_choice[row]
    [1;34m21[0m:                 item.push(xlsx.row(j))
    [1;34m22[0m:             [32melse[0m
    [1;34m23[0m:                 [1;34m#  同じ選択肢が入らないように[0m
    [1;34m24[0m:                 item.push(xlsx.row(j+[1;34m1[0m))
    [1;34m25[0m:             [32mend[0m
    [1;34m26[0m:         [32mend[0m
    [1;34m27[0m:         [1;34m# shuffleで選択肢をばらばらにする[0m
    [1;34m28[0m:         questions.push([1;34;4mQuiz[0m.new(item[[1;34m0[0m][[1;34m1[0m],[item[[1;34m0[0m][[1;34m2[0m], item[[1;34m1[0m][[1;34m2[0m], item[[1;34m2[0m][[1;34m2[0m], item[[1;34m3[0m][[1;34m2[0m]].shuffle, item[[1;34m0[0m][[1;34m2[0m]))
    [1;34m29[0m:     [32mend[0m
    [1;34m30[0m:     questions
    [1;34m31[0m: [32mend[0m

