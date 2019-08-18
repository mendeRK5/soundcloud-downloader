#!/bin/bash
# sound - cloud auto downloader...
# this tools create by widhisec
GREEN=$(tput setaf 2) #HIJAU
NORMAL=$(tput sgr0)
RED=$(tput setaf 1) #MERAH
apireq(){
    ok=$(curl --url "https://api-v2.soundcloud.com/search?q=${oxe}&variant_ids=&facet=model&user_id=102536-30194-471994-524034&client_id=7OzdeoyYOqcZHL6WPjwCS3HqdkgjvKID&limit=$page&offset=0&linked_partitioning=1&app_version=1565955166&app_locale=en" --silent)
   grab=$(echo -e "$ok" | grep -Po '(?<=permalink_url":")[^"]*' | grep -o "https://soundcloud.com/.*/.*")
     num=$(echo -e "$grab" | grep -n "")
       z=$(printf '%s' "$num")
       ok=$(echo $z | grep -n "" | grep -o "$pilih:.*" | grep -n "" | gawk '{ print $1 }' | grep -Eo "(http|https)://[a-zA-Z0-9./?].*")
        v=$(printf '%s' "$ok")
     okx=$(curl --silent 'https://sounddownmp3.com/down.php' \
     -H 'authority: sounddownmp3.com' \
     -H 'origin: https://sounddownmp3.com' \
     -H 'upgrade-insecure-requests: 1' \
     -H 'content-type: application/x-www-form-urlencoded' \
     -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36' \
     -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' \
     -H 'referer: https://sounddownmp3.com/' --data "url=$v" --compressed)
        sum=$(echo -e "$okx" | grep -oP 'value="\K[^"]+' | tail -1)
      nm=$(echo -e "$okx" | grep -oP 'value="\K[^"]+' | head -1)
          nme=$(echo $nm | bash e)
  soso=$(curl --silent 'https://sounddownmp3.com/down.php' \
  -H 'content-type: application/x-www-form-urlencoded' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' \
  -H 'referer: https://sounddownmp3.com/down.php' --data "sName=${nme}&submit=${sum}" --compressed -# --output $out.mp3)
   echo "[WAIT]..."
cod=$(curl 'https://www.aconvert.com/audio' --silent -L \
-H 'Accept: */*' \
-H 'Referer: https://www.aconvert.com/audio/' \
-H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36' | grep -Po '(?<=id="code" value=").*?(?=")')
xo=$(curl 'https://s21.aconvert.com/convert/convert-batch.php' --silent \
-H 'Accept: */*' \
-H 'Referer: https://www.aconvert.com/audio/' \
-H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36' \
-H "Content-Type: multipart/form-data"  -F "file=@${out}.mp3" -F "code=${cod}" -F "targetformat=mp3" -F "customaudiobitrate=" -F "customaudiobitrate=1040" -F "audiobitratetype=1" | jq -r .filename)
      rm -rf $out.mp3
      url="https://s21.aconvert.com/convert/p3r68-cdx67/${xo}"
      wget ${url} --show-progress -q -O "$out.mp3"
# DONE
}
scrap(){
	#ok=$(curl --silent "https://soundcloud.com/search?q=$m" | grep -Po '(?<=<li><h2><a href=)(.*?)(?=</a></h2></li>)' | sed 's/&#x27;ll//g')
 #printf "$ok" >> s
     #cat s | cut -d ">" -f2 >> njir
    curl -s --request GET "https://api-v2.soundcloud.com/search?q=$oxe&variant_ids=&facet=model&user_id=102536-30194-471994-524034&client_id=7OzdeoyYOqcZHL6WPjwCS3HqdkgjvKID&limit=$page&offset=0&linked_partitioning=1&app_version=1565955166&app_locale=en" \
     -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36' | grep -Po '(?<=title":")[^"]*' >> njir
file=njir
# set field separator to a single white space 
while IFS=' ' read f1
do
echo -e "${GREEN}\t[*] ${NORMAL}: $f1"  
done < "$file"
rm -rf njir
}
echo -e "  
         
    \033[0;31m_________________________________________ 
            _____      
           /    /      
          /    /             
         /    /_____      \033[0;31m[ CREATE BY WIDHISEC ]
        /          /    \033[0;34m[ SOUND CLOUD DOWNLOADER ] 
       /_____     /          
            /    /       
            /   /      
           /   /       
           /  /
             / 
     ******************************************"  
printf "          powered by zsecc0de-crew.id\n"
echo -n "${NORMAL}query :"; read ii
echo -n "${NORMAL}pages :"; read page
oxe=$(echo $ii | bash e)
scrap
echo -n "${RED}[?] ${NORMAL}NOMER  -> "; read pilih
echo -n "${RED}[?] ${NORMAL}OUTPUT ->"; read out
apireq