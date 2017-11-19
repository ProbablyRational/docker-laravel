# Docker Laravel server
> This is a small docker container to serve laravel

[![Twitter](https://img.shields.io/twitter/url/https/store.docker.com/community/images/probablyrational/laravel.svg?style=social)](https://twitter.com/intent/tweet?text=Wow:&url=https://github.com/ProbablyRational/docker-laravel)
[![Github Stars](https://img.shields.io/github/stars/probablyrational/laravel.svg)](https://github.com/ProbablyRational/docker-laravel)
[![Docker Pulls](https://img.shields.io/docker/pulls/probablyrational/laravel.svg)](https://store.docker.com/community/images/probablyrational/laravel)
[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

## Useage

```sh

docker create \ 
  --name=laravel \
  -v <path to data>:/var/www \
  -p 80:80 
  probablyrational/laravel

```

## Parameters

### Enviromental varibles

Please see `.env.example`

### Files and folders

- <path to data>:/var/www
  
### Ports

- 80

## Meta

Probably Rational Ltd. – [@probablypi](https://twitter.com/probablypi) – contact@probablyrational.com

Distributed under the MIT license. See ``LICENSE`` for more information.

[https://github.com/probablyrational/docker-laravel](https://github.com/probablyrational/)

## Contributing

1. Fork it (<https://github.com/probablyrational/docker-laravel/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request
