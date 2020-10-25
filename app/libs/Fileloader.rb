class Fileloader

    def self.get_lines
        xlsx = Roo::OpenOffice.new('./word/toeic2000.ods')
        xlsx.default_sheet = xlsx.sheets[0]
        return xlsx
    end

end
