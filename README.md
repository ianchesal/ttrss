# Experiments with Tiny Tiny RSS

I miss RSS. This is me experimenting with running [Tiny Tiny RSS](https://tt-rss.org/) in a Docker setup. Maybe I'll move this to a Linode server some day?

## Instructions

If you're not running Ubuntu 18.04 already you'll need Vagrant and VirtualBox to launch a local instance. Do whatever you need to do on your machine to get these things installed. Once installed you can bring up a Vagrant-managed Ubuntu instance with everything installed on it by doing:

    vagrant up

Once up'ed you can connect to http://192.168.33.10/ and TTRSS will be running for you with `admin:password` as the login information.

If you're running Ubuntu 18.04 you can get up and running with:

     ./install-ttrss.sh

Once you're done, TTRSS listening on http://localhost:80 for you with `admin:password` as the login information.

## Dependencies

* Using clue's ttrss Docker image from here: https://github.com/clue/docker-ttrss
* Using the default Postgres Docker image: https://hub.docker.com/_/postgres/
