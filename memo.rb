require "csv"


puts "1(新規でメモを作成) 2(既存のメモ追記する)"
puts "いずれかのを入力し、Enterキーを押してください"

memo_type = gets.to_i

if memo_type == 1
  puts "作成したいファイル名(拡張子除く)を入力し、完了したらEnterキーを押してください"
  file_name = gets.chomp
  
  puts "メモしたい内容を入力し、完了したらCtrl + Dキーを押してください"
  memo = readlines
  
  CSV.open("#{file_name}.csv","w") do |csv|
    csv << ["#{memo}"]
  end
  
elsif memo_type == 2
  puts "追記したいファイル名(拡張子除く)を入力し、Ctrl + Dキーを押してください"
  puts "ファイル名が見つからない場合、新規に作成します"
  file_name = gets.chomp
  
  puts "追記したい内容を入力し、完了したらCtrl + Dキーを押してください"
  memo = readlines
  
  CSV.open("#{file_name}.csv","a+") do |csv|
    csv << ["#{memo}"]
  end
  
else
  puts "入力が誤っています。再度最初から実行して下さい"
end