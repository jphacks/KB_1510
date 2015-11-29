require 'open-uri'
require 'nokogiri'
#! ruby
require 'csv'

#スクレイピングデータを格納する配列
Dataarr = []
data1 = []
data2 = []
# スクレイピング先のURL
url = 'http://www.asoview.com/hyogo/280205/'
# C <<  [is,js,str]

charset = nil
html = open(url) do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end

# htmlをパース(解析)してオブジェクトを作成
doc = Nokogiri::HTML.parse(html, nil, charset)

doc.xpath('//h2[@class="plan-summary-list__plan-title-wrap"]').each do |node|
  # tilte
  title = node.css('a').inner_text
  p title
  p node.css('a').inner_text
  linkurl = "http://www.asoview.com/"+node.css('a').attribute('href').value
  p linkurl

  p node.css('div div a').inner_text

  # 記事のサムネイル画像
  # img =  node.css('div div aimg').attribute('src').value
   data1 <<  [title,linkurl]
  # 記事のurl
  # p node.css('a').attribute('href').value
end


doc.xpath('//div[@class="plan-summary-list__access-wrap"]').each do |node|
  # tilte

  address = node.css('p').inner_text
  p address
  data2 << address
  # # 記事のサムネイル画像
  # p node.css('img').attribute('src').value

  # # 記事のサムネイル画像
  # p node.css('a').attribute('href').value
end

p"data1"
p data1
p"data2"
p data2



p data1.length
p data2.length
max = data1.length
row = [] #配列結合用の、列配列
for num in 0..max-1 do
  row[num] = []
  row[num] << data1[num][0]
  row[num] << data1[num][1]
  # row[num] << data1[num][2]
  row[num] << data2[num]
  Dataarr << row[num]
end

p Dataarr

p "data1[4]"
p data1[4]
p data1[4][1]
p data2[4]
p"this->end"

 #閉路集合の初期化と、csvへの格納
CSV.open("Sannnomiya.csv","wb") do |csv|
    Dataarr.each do |bo|
      csv << bo
    end
  end

  