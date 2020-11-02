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

end
