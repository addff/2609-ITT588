#2609-ITT588 Kelassir

## Lab Work Ruby on Rails

```
#!/bin/bash
mkdir -p kelassir/src
cd kelassir/
docker run --rm -v ./src:/app -w /app ruby:3.3 bash -c "gem install rails && rails new ruby_app1"
cd src/ruby_app1
docker run --rm --name sir_tmp -it -v .:/rails -w /rails -p 3000:3000 ruby:3.3 bash -c "bundle install && ./bin/rails server -b 0.0.0.0"
```

ok check dekat browser http://ip_address:3000 kalau dah dapat frontpage ruby dah boleh save container ke image.
buka terminal baru
```
#!/bin/bash
sudo docker commit sir_tmp kelassir/ruby:1.0
```