class Fileloader

    def self.get_lines(word_file)
        if word_file == 0
            xlsx = Roo::OpenOffice.new('./word/toeic2000.ods')
            xlsx.default_sheet = xlsx.sheets[0]
        elsif word_file == 1
            xlsx = Roo::OpenOffice.new('./word/deep.ods')
            xlsx.default_sheet = xlsx.sheets[0]
        elsif word_file == 2
            xlsx = Roo::OpenOffice.new('./word/novel.ods')
            xlsx.default_sheet = xlsx.sheets[0]
        end
        return xlsx
    end

    def self.dictionary
        files = []
        files.push(Roo::OpenOffice.new('./word/toeic2000.ods'))
        files.push(Roo::OpenOffice.new('./word/deep.ods'))
        files.push(Roo::OpenOffice.new('./word/novel.ods'))
    end

    def self.pdf_words(select_num, word_range, select_file)
        file = self.get_lines(select_file.to_i)
        select_num = select_num.to_i
        range = word_range.to_i
        if range < 100
            range = 100
        end
        word_set = []
        for i in select_num..(select_num + range - 1) do
            word_set.push([file.row(i)[1], file.row(i)[2]])
        end
        tmp_word_set = word_set.deep_dup
        word_set = word_set.shuffle
        while word_set.size < 500
            tmp_word_set = tmp_word_set.shuffle
            for i in 0..tmp_word_set.size-1
                word_set.push(tmp_word_set[i])
            end
        end
        word_set[Range.new(0, 499)]
    end

    def self.reads(search,number,model)
        dis =self.get_lines(number.to_i)
        list = []           
        if model == "english"   
            2.upto(dis.last_row) do |row|
                if dis.cell(row, 2).include? search
                    list.push dis.row(row)
                end
            end
        elsif model == "japan"
            2.upto(dis.last_row) do |row|
                if dis.cell(row, 3).include? search
                    list.push dis.row(row)
                end
            end
        end                
        return list
    end

    def self.reader(number)
        dis =self.get_lines(number.to_i)
        list = []      
        2.upto(dis.last_row) do |row|
              list.push dis.row(row)
        end                
        return list
    end

end
