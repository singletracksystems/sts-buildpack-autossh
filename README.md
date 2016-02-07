# sts-buildpack-autossh

A custom Heroku [buildpack](https://devcenter.heroku.com/articles/buildpacks) for that securely configures an SSH
tunnel to another server from each dyno and ensure it stays up by using [autossh](http://www.harding.motd.ca/autossh/).

This project uses `make` for maintenance and testing.

## Updating conda installer

To update the cached version of conda, run:

`make vendor_update`

## Testing

For testing changes to this buildpack we recommend using [Vagrant](https://www.vagrantup.com/) with the `Vagrantfile` provided.

To build and run your vagrant box, run:

`make vagrant_start`

Inside the Linux virtual host, run:

`cd /vagrant && make test`

That's all folks. Enjoy!
