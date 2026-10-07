#2609-ITT588 Kelassir

## Lab Work Ruby on Rails
First nak install rails dulu dalam container ruby dan dapatkan satu folder projek nama ruby_app1
```
#!/bin/bash
mkdir -p kelassir/src
cd kelassir/
tmux new -s ruby
pwd
sudo docker pull ruby:3.3
sudo docker run --rm -v ./src:/app -w /app ruby:3.3 bash -c "gem install rails && rails new ruby_app1"
cd src/ruby_app1
pwd
sudo docker run --rm --name sir_tmp -it -v .:/rails -w /rails -p 3001:3000 ruby:3.3 bash -c "bundle install && ./bin/rails server -b 0.0.0.0"
```

ok check dekat browser http://ip_address:3001 kalau dah dapat frontpage ruby dah boleh save container ke image.
buka terminal baru
```
#!/bin/bash
sudo docker images
sudo docker ps
sudo docker commit sir_tmp kelassir/ruby:1.0
sudo docker images
pwd
```

ok dah ada image nama kelassir/ruby:1.0 kita nak pakai image tu pada new container. so matikan continer sir_tmp guna CTRL+C dan kita boleh first try run container tanpa ubah apa-apa.
```
#!/bin/bash
sudo docker run --rm --name sir_2 -it -v .:/app -w /app -p 3002:3000 kelassir/ruby:1.0 bash -c "./bin/rails server -b 0.0.0.0"
```
boleh run kan? check kat browser pada port 3002 bukan 3000. http://ip_address:3002. dan ok boleh matikan guna CTRL+C.

so kita siapkan Dockerfile baru dan yaml docker-compose. Dockerfile lama tadi kita dah guna runkan masuk ke dalam sir_tmp kan. so yang tu kita archive kan dengan cara move ke dalam folder works. first thing first kena own folder ruby_app1 tu dulu. kalau user nama sir ...

```
#!/bin/bash
ls -l
ls -l ..
sudo chown -R sir .
ls -l ..
mkdir works
ls -l
mv Dockerfile works
ls
```
jom try docker compose pula

```
#!/bin/bash
pwd
cp works/database.yml config/database.yml
cd ../..
pwd
tree -L 3
```
ok isi docker-compose.yml dengan
```
services:
    webapp:
        image: kelassir/ruby:1.0
        container_name: sir_3
        volumes:
            - "./src:/rails"
        ports:
            - "3003:3000"
        command: bash -c "/rails/ruby_app1/bin/rails server -b 0.0.0.0"
```

ok selesai. alhamdulillah.

