package "postgresql-9.3"
package "postgresql-contrib-9.3"
package "libpq-dev"

bash "create vagrant postgresql user" do
  code "createuser vagrant -s"
  user "postgres"
  not_if "sudo -u postgres psql postgres -tAc \"SELECT 1 FROM pg_roles WHERE rolname='vagrant'\" | grep 1"
end
