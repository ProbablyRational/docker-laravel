# Docker catchall http server
> This is a small docker container to server a single index.php to all inbound requests.

[![Twitter](https://img.shields.io/twitter/url/https/store.docker.com/community/images/probablyrational/catchall-http.svg?style=social)](https://twitter.com/intent/tweet?text=Wow:&url=https://github.com/ProbablyRational/docker-catchall-http)
[![Github Stars](https://img.shields.io/github/stars/probablyrational/catchall-http.svg)](https://github.com/ProbablyRational/docker-catchall-http)
[![Docker Pulls](https://img.shields.io/docker/pulls/probablyrational/catchall-http.svg)](https://store.docker.com/community/images/probablyrational/catchall-http)
[![MIT license](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

## Installation

Docker:

```sh
docker run -d -p 80:80 probablyrational/catchall-http
```

## Usage example

The following enviromental varibles can be used to change the default splash page, or you can mount /var/www/html/index.php

- PAGE_TITLE = "Service unavailable"
- PAGE_BODY = "#domain# is currently unavailable"
- PAGE_HOMELINK = "https://probablyrational.com/about"
- PAGE_HOMETEXT = "About us"

## Meta

Probably Rational Ltd. – [@probablypi](https://twitter.com/probablypi) – contact@probablyrational.com

Distributed under the MIT license. See ``LICENSE`` for more information.

[https://github.com/probablyrational/docker-catchall-http](https://github.com/probablyrational/)

## Contributing

1. Fork it (<https://github.com/probablyrational/docker-catchall-http/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request
