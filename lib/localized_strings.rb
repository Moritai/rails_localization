require "json"
#参考；https://noknow.info/it/php/implemented_localization_by_json?lang=ja

class LocalizedStrings
    #localizedStringsを完成させることがこのクラスの目的：localizedStrings = {langCode: {文言のキー：文言}}
    attr_accessor :localizedStrings
   
   #Jsonファイル（文言リソース）の中身を読み込み、
   #ハッシュテーブルへと変換したlocalizedStrings = {文言キー：その言語の文言リソース}を作る。
   def addLocalizedFile(jsonFile)
       #文言（Json）ファイルから文言（Json）ファイルの中身を読み込む。
       json_contents = ""
       File.open(jsonFile){|file|
        json_contents = file.read
       }
       
       if json_contents == false
           return
       end
       
       map_contents = JSON.parse(json_contents)
    
       self.localizedStrings = map_contents
   end
   
end
    