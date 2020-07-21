print "画像情報の確認(任意の画像ファイルを入力) > "
picture = gets.chomp
file_name = picture
name = File.basename(file_name, ".*")
ext = File.extname(file_name)
convert_file_name = "#{name}_done#{ext}"
system 'identify -format "サイズ: %[width]x%[height] pixel / カラー: %[colorspace] / ファイル形式: %m\n" fruit.jpg'
actions = ["resize(px)", "resize(%)", "mosaic", "sketch", "monochrome"]
actions.each.with_index(1) do |action, i|
  puts "#{i}.#{action}"
end
print "処理を選択 > "
i = gets.to_i

selected_action = actions[i - 1]
puts "#{selected_action}処理ですね、任意の数値を入力して下さい。"
case i
when 1
  print "高さを入力(px) > "
  height = gets.to_i
  print "幅を入力(px) > "
  width = gets.to_i
  system "convert #{picture} -geometry #{height}x#{width} #{convert_file_name}"
when 2
  print "画像の大きさを調整して下さい(%) > "
  size = gets.to_i
  system "convert #{picture} -geometry #{size}%x#{size}% #{convert_file_name}"
when 3
  print "モザイクの強さを調整して下さい(数値が大きいほどぼかしが大きくなります。) > "
  mosaic = gets.to_i
  system "convert #{picture} -blur #{mosaic}x#{mosaic} #{convert_file_name}"
when 4
  print "スケッチ風画像に変換します。"
  system "convert #{picture} -colorspace gray -sketch 0x20+135 #{convert_file_name}"
when 5
  print "モノクロ風に変換します。"
  system "convert #{picture} -colorspace gray \
    \\( +clone -blur 0x2 \\) +swap -compose divide -composite \
    -linear-stretch 5%x0% #{convert_file_name}"
end
if i == 1
  # print "高さを入力(px) > "
  # height = gets.to_i
  # print "幅を入力(px) > "
  # width = gets.to_i
  # system "convert #{picture} -geometry #{height}x#{width} #{convert_file_name}"
elsif i == 2
  # print "画像の大きさを調整して下さい(%) > "
  # size = gets.to_i
  # system "convert #{picture} -geometry #{size}%x#{size}% #{convert_file_name}"
elsif i == 3
  # print "モザイクの強さを調整して下さい(数値が大きいほどぼかしが大きくなります。) > "
  # mosaic = gets.to_i
  # system "convert #{picture} -blur #{mosaic}x#{mosaic} #{convert_file_name}"
elsif i == 4
  # print "スケッチ風画像に変換します。"
  # system "convert #{picture} -colorspace gray -sketch 0x20+135 #{convert_file_name}"
elsif i == 5
  # print "モノクロ風に変換します。"
  # system "convert #{picture} -colorspace gray \
  #   \\( +clone -blur 0x2 \\) +swap -compose divide -composite \
  #   -linear-stretch 5%x0% #{convert_file_name}"
end
