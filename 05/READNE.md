# 1. Sklonowanie  repo bloga
```
git clone https://github.com/leszekuchacz/blog.uchacz.it
cd blog.uchacz.it/05/
```

# 2. Przygotowanie beanstalka do deploy 
```
pip install awsebcli
mkdir  ~/.elasticbeanstalk
cp .elasticbeanstalk/config.yml ~/.elasticbeanstalk/config.yml
```

# 3. Deploy paczki do aws elastic beanstalk
```
eb init -r eu-central-1 -k moj-publiczny-klucz-ssh -p python-2.7 contact
eb create production -r eu-central-1 -i t2.micro --tags Name=angharad -sr front_api  -k moj-publiczny-klucz-ssh
```
