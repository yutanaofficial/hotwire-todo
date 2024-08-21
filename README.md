````
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# How to start the project

## 1. Prerequisite

### 1.1 rbenv
### Installing RBENV on macOS
1. ติดตั้ง rbenv ผ่าน brew ใน Terminal

```$ brew install rbenv```

2. เริ่มต้น rbenv โดย

```$ rbenv init```

3. คัดลอกให้ rbenv รันทุกครั้งที่เปิด command line

```$ eval '$(rbenv init -)' >> ~/.bashrc```

ถ้าใช้ zsh ให้เปลี่ยน .bashrc เป็น .zshrc แทน

4. โหลดไฟล์ใหม่

```$ source $HOME/.bash_profile```

### 1.2 Install Rails
1. Install rails version 3.3.0

```$ rbenv install 3.3.0```

2. Install bundler

```$  gem install bundler```

3. Install rails

```$ gem install rails```

```$ bundle install```

4. ทุกๆครั้งที่เราติดตั้ง gem ที่มี command ติดมาด้วยเช่น rails เป็นต้น เราจะต้องทำการ rehash เสมอเพื่อให้สามารถเรียก command ใหม่ที่ติดตั้งมาได้

```$ rbenv rehash```

## 2. Start rails server

2.1 Precompile the assets (JavaScript, CSS, and images) before deployment

```$ bundle exec rake assets:precompile```

2.2 Create database

```$ rails db:create```

2.3 run command start server

```$ rails db:migrate```

2.4 run command start server

```$ rails server``` or
```$ rails s``` or ```./bin/dev```
````
