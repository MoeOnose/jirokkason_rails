require "csv"
CSV.foreach('db/chain.csv') do |row|
    ChainFreq.create(:prefix1 => row[1], :prefix2 => row[2], :suffix => row[3], :freq => row[4])
end