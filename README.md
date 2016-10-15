# Benchmarking Redis and MongoDB with Ruby [![Build Status](https://travis-ci.org/simplonco/ruby-benchmark-redis-mongo.svg?branch=master)](https://travis-ci.org/simplonco/ruby-benchmark-redis-mongo)


## Objectif : Comparer le temps de requete de toute une table

Pour le test : création de deux bases de données identiques (redis et mongo), peuplées de 1000 entrées utilisateurs et des params (nom, prénom, password, bio)


## Outils utilisés

- gem faker : pour peupler une base de données d'ipsum lorem
- helper [benchmark](http://www.ruby-doc.org/stdlib-2.1.0/libdoc/benchmark/rdoc/Benchmark.html#method-c-bm) : natif dans ruby


## Redis

- [Redis](http://redis.io) est une base de donnée clé / valeur optimisé sur la vitesse d'accès. Elle est généré dans la mémoire vive et n'est donc, par défaut, pas persistante mais très rapide.
- [Tutoriel Redis](http://try.redis-db.com/)
- [Command cheat sheet](http://redis.io/commands)

### Config

Installer Redis sur votre ordi:
```shell
$ wget http://download.redis.io/releases/redis-2.8.4.tar.gz
$ tar xzf redis-2.8.4.tar.gz
$ cd redis-2.8.4
$ make
```
_[source](http://redis.io/download)_

Installer la [gem redis](https://github.com/redis/redis-rb) :

* _dans votre Gemfile :_ `gem "redis"`
* _dans votre application ruby :_
```ruby
require 'redis'
$r = Redis.new(:host => 'localhost', :port => 6379)
```

### Structure

Simple [clé: valeur](http://redis.io/commands#generic)

exemple: 
```ruby
redis.set("mykey", "hello world")
=> "OK"
redis.get("mykey")
=> "hello world"
```
[hash](http://redis.io/commands#hash)

```json
clé1erniveau: {
    clé2iemeniveau: valeur,
    clé2iemeniveau: valeur,
    clé2iemeniveau: {
        clé3iemeniveau: valeur
    }
}
```

## [Mongo](http://mongodb.org)

C'est une autre forme de base de données, axé sur le non-relationnel. Pratique pour stocker des valeurs non-dynamique (exemple des fiches utilisateurs)

[Installer Mongo sur votre machine](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/)

_Gem :_ `gem install mongo`

[Github](https://github.com/mongodb/mongo-ruby-driver)


## Benchmark

Dans le dossier de l'appli, depuis le terminal :
```shell
pry
```
puis dans pry :
```ruby
require './populate_task_mongo.rb'
```
(mets plein de truc dans mongo)
```ruby
require './bm_all_task_mongo.rb'
```
(output le temps qu'il met pour tous les récupérer)

Même démarche avec Redis :
```ruby
require './populate_task_redis.rb'
require './bm_all_task_redis.rb'
```
puis comparez les temps: normalement, Redis doit être autour de 7 fois plus rapide que Mongo.
