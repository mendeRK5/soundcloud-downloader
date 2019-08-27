#!/bin/bash
# sound - cloud auto downloader...
# this tools create by widhisec
# U[P]DATE ON 24/08/2019
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
      test=$(curl --silent -I "https://scdownloader.io" -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36" --location | grep 'set-cookie:' |  grep -Po '(?<=PHPSESSID=)[^,]*' | gawk '{print $1}')
      test1=$(curl --silent -I "https://scdownloader.io" -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36" --location | grep 'set-cookie:' |  grep -Po '(?<=__cfduid=)[^,]*' | gawk '{print $1}')
      tok=$(curl --silent "https://scdownloader.io" -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36"       -H "cookie: __cfduid=$test1 PHPSESSID=$test" | grep -Po '(?<=id="report_token" value=")[^"]*')
      #-H 'cookie: __cfduid=d857855c6a301899c5b23a0e1a3b638121566660165; PHPSESSID=mtg98c06uucd4k3i6cbq1bgho5; _ga=GA1.2.2144666723.1566660165; _gid=GA1.2.1862713229.1566660165; _gat=1' 
      oaoaoa=$(curl 'https://scdownloader.io/download.html' --silent \
      -H 'origin: https://scdownloader.io' \
      -H 'upgrade-insecure-requests: 1' \
      -H 'content-type: application/x-www-form-urlencoded' \
      -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36' \
      -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' \
      -H 'sec-fetch-site: same-origin' \
      -H 'referer: https://scdownloader.io/' \
      -H 'accept-encoding: gzip, deflate, br' \
      -H "cookie: __cfduid=$test1 PHPSESSID=$test" \
      -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' --data "url=${v}&token=$tok" --compressed | grep -Po '<a href="\K.*?(?=".*)' | grep "download")
      downlodgan=$(echo "${oaoaoa}")
      curl --silent "https://scdownloader.io${downlodgan}" -H 'authority: scdownloader.io' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36' -H 'sec-fetch-mode: navigate' -H 'sec-fetch-user: ?1' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3' -H 'sec-fetch-site: same-origin' -H 'referer: https://scdownloader.io/download.html' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: id-ID,id;q=0.9,en-US;q=0.8,en;q=0.7' \
      -H "cookie: __cfduid=$test1 PHPSESSID=$test" --compressed --output "$out.mp3"
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
rm -rf OUT.tmp
}
scrap(){
	#ok=$(curl --silent "https://soundcloud.com/search?q=$m" | grep -Po '(?<=<li><h2><a href=)(.*?)(?=</a></h2></li>)' | sed 's/&#x27;ll//g')
 #printf "$ok" >> s
     #cat s | cut -d ">" -f2 >> njir
    curl -s --request GET "https://api-v2.soundcloud.com/search?q=$oxe&variant_ids=&facet=model&user_id=102536-30194-471994-524034&client_id=7OzdeoyYOqcZHL6WPjwCS3HqdkgjvKID&limit=$page&offset=0&linked_partitioning=$page&app_version=1565955166&app_locale=en" \
     -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36' | grep -Po '(?<="permalink_url":")[^"]*' | grep -o "https://soundcloud.com/.*/.*" | grep -n "" >> njir
file=njir
# set field separator to a single white space 
while IFS=' ' read f1
do
echo -e "${GREEN}\t[*] ${NORMAL}| $f1"  
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