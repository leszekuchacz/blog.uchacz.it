#/bin/bash
set -e 
set -o errexit

name=`ls *.cfg | sed -e 's/\.[^./]*$//' | head -n 1`

if [ "$name" == "" ];then
 
  echo "Cfg file not find, dont worry, create new one :)"
  read -p "CN=" CN
[ -z "$CN" ]  && echo "CN is required, exit 1" && exit 1
  read -p "C=" C
  read -p "L=" L
  read -p "ST=" ST
  read -p "O=" O

cat << EOF > ./$CN.cfg
[req]
default_bits = 4096
prompt = no
default_md = sha256
distinguished_name = dn
[ dn ]
EOF

  printf "Subject:" 
  [ -n "$C" ] &&  printf "C = $C," && echo "C = $C" >> ./$CN.cfg 
  [ -n "$ST" ] && printf "ST = $ST," && echo "ST = $ST" >> ./$CN.cfg
  [ -n "$L" ]  && printf "L = $L," && echo "L = $L" >> ./$CN.cfg 
  [ -n "$O" ]  && printf "O = $O," && echo "O = $O" >> ./$CN.cfg
  [ -n "$CN" ]  && printf "CN = $CN" && echo "CN = $CN" >> ./$CN.cfg
  printf "\n CFG File created.\n"
  name=$CN
fi

if [ -f "./$name.key" ];then 
	echo "Key file exists: $name.key! exit 1" 
	exit 1
else
openssl req -new -sha256 -nodes -out $name.csr -newkey rsa:4096 -keyout $name.key -config $name.cfg
openssl req -in $name.csr -noout -text | grep Subject:
fi
