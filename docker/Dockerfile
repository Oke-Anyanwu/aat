FROM phusion/baseimage:0.9.10

RUN apt-get update

RUN apt-get install -y build-essential
RUN apt-get install -y curl libcurl4-openssl-dev ca-certificates
RUN apt-get install -y vim
RUN apt-get install -y git-core
RUN apt-get install -y libsqlite3-dev

RUN addgroup --gid 9999 app
RUN adduser --uid 9999 --gid 9999 --disabled-password --gecos "Application" app
RUN usermod -L app

RUN su app -c "git clone https://github.com/sstephenson/rbenv.git ~/.rbenv"
ADD .bashrc /home/app/.bashrc
RUN chown app:app /home/app/.bashrc
RUN su app -c "git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build"
RUN su app -c "source /home/app/.bashrc"
RUN su app -c "/home/app/.rbenv/bin/rbenv install 2.1.1 && /home/app/.rbenv/bin/rbenv global 2.1.1"
RUN su app -c "/home/app/.rbenv/shims/gem install bundler && /home/app/.rbenv/bin/rbenv rehash"

RUN mkdir /home/app/.ssh
ADD id_rsa /home/app/.ssh/id_rsa
ADD id_rsa.pub /home/app/.ssh/id_rsa.pub
ADD ssh_config /home/app/.ssh/config
RUN chmod 600 /home/app/.ssh/id_rsa && chmod 700 /home/app/.ssh && chown -R app:app /home/app/.ssh

RUN su app -c "git clone git@github.com:aelogica/aat.git /home/app/aat"
RUN su app -c "cd /home/app/aat && /home/app/.rbenv/shims/bundle install"

RUN apt-get install -y nodejs
