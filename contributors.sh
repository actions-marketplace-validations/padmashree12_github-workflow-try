
curl 'https://api.github.com/repos/${1}/contributors' >> contributors.json

rm CONTRIBUTORS.md

clear
echo "Shout out to our contributors" >> "CONTRIBUTORS.md"
echo "" >> "CONTRIBUTORS.md"
jq -c '.[]' contributors.json | while read i; do
    echo $i | jq -r '.login' >> "test.txt";
    username=$(cat test.txt)
    rm "test.txt"
    echo $i | jq -r '.html_url' >> "test.txt";
    html_url=$(cat test.txt)
    rm "test.txt"
    echo "* [${username}](${html_url})" >> "CONTRIBUTORS.md"
    echo "" >> "CONTRIBUTORS.md"
done

rm contributors.json
