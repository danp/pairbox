# pairbox

A vagrant setup for pairing. Features things commonly needed to pair on ruby and Go projects.

## Using

1. `vagrant plugin install vagrant-omnibus`
2. `vagrant up`
3. `vagrant ssh`
4. work on things in `/projects`

Currently `/projects` in the VM is set up as a synced folder to `~/Projects` on the host.
