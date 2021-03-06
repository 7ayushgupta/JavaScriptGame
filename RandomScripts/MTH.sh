#A script to download all links from Google Drive
#Credits to Vaibhav Thakkar  for idea
echo "Please enter the Folder Name to save into:"
read folder
mkdir "$folder"
cd "$folder"
echo "Please enter the URL of the site containing the Google Drive links:"
read url
lynx -dump $url | grep "drive.google" | grep -o  "id=.*\|d\/.*/view" | cut -d'=' -f2 | cut -d'/' -f2 > links.txt 
i=0
while read LINK
do
	    i=$(($i + 1))
	        curl -L -o "$folder$i" "https://drive.google.com/uc?export=download&id=${LINK}"
	done < links.txt
	cd ..
	rm links.txt
