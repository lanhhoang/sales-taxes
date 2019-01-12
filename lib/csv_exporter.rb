require 'csv'

class CSVExporter
  def initialize(data_export)
    @data_export = data_export
  end

  def export
    CSV.open(Dir.pwd + '/output/output.csv', 'w') do |csv|
      data.each do |row|
        csv << row
      end
    end
  end

  private

  attr_reader :data_export

  def data
    data = []
    data += data_export.items.map(&:decorate)
    data.push(["Sales Taxes: #{data_export.total_taxes}"])
    data.push(["Total: #{data_export.total_price_with_taxes}"])
  end
end
