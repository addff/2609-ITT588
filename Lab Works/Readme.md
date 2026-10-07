#2609-ITT588 Kelassir

## Lab Work Ruby on Rails
First nak install rails dulu dalam container ruby dan dapatkan satu folder projek nama ruby_app1
```
#!/bin/bash
mkdir -p kelassir/src
cd kelassir/
pwd
docker run --rm -v ./src:/app -w /app ruby:3.3 bash -c "gem install rails && rails new ruby_app1"
cd src/ruby_app1
pwd
docker run --rm --name sir_tmp -it -v .:/rails -w /rails -p 3000:3000 ruby:3.3 bash -c "bundle install && ./bin/rails server -b 0.0.0.0"
```

ok check dekat browser http://ip_address:3000 kalau dah dapat frontpage ruby dah boleh save container ke image.
buka terminal baru
```
#!/bin/bash
sudo docker ps
sudo docker commit sir_tmp kelassir/ruby:1.0
sudo docker images
pwd
```

ok dah ada image nama kelassir/ruby:1.0 kita nak pakai image tu pada new container. so kita siapkan Dockerfile baru dan yaml docker-compose. Dockerfile lama tadi kita dah guna runkan masuk ke dalam sir_tmp kan. so yang tu kita archive kan dia sekali dengan config/database.yml, so saya move ke dalam folder works. first thing first kena own folder ruby_app1 tu dulu. kalau user nama sir ...

```
#!/bin/bash
sudo chown -R sir .
ls -l ..
mkdir works
ls -l
mv Dockerfile works
mv config/database.yml works
ls
```
jom try tukar dalam file config/environments/development.rb pula, kalau permission dah tukar kita boleh rewrite file ni. lepas tukar kita kena rebuild lagi sekali untuk replace Gemfile.lock.
ok kita tukar cache management kita pakai redis, jom. tukar baris ni
```
config.cache_store = :redis_cache_store, { url: ENV.fetch("REDIS_URL") { "redis://localhost:6379/1" } }
```
rebuild lagi sekali untuk owerwrite Gemfile.lock
```
#!/bin/bash
docker run --rm -v .:/app -w /app ruby:3.3 bundle lock
```

next buat Dockerfile dan docker-compose.yml untuk ruby_app kita guna folder yang dah berjaya dijana dan teruskan mengedit ruby_app kepada web app yang dikehendaki.

