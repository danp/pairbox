bash "install ruby-install" do
  code <<-EOF
    set -e
    cd /tmp
    wget -O ruby-install-0.4.3.tar.gz https://github.com/postmodern/ruby-install/archive/v0.4.3.tar.gz
    tar -xzvf ruby-install-0.4.3.tar.gz
    cd ruby-install-0.4.3/
    make install
  EOF

  creates "/usr/local/bin/ruby-install"
end

bash "install chruby" do
  code <<-EOF
    set -e
    cd /tmp
    wget -O chruby-0.3.8.tar.gz https://github.com/postmodern/chruby/archive/v0.3.8.tar.gz
    tar -xzvf chruby-0.3.8.tar.gz
    cd chruby-0.3.8/
    make install
  EOF

  creates "/usr/local/share/chruby"
end

bash "install ruby 2.1.2" do
  code "ruby-install --jobs=4 ruby 2.1.2 -- --disable-install-doc"

  creates "/opt/rubies/ruby-2.1.2"
end

file "/etc/profile.d/chruby.sh" do
  content <<EOF
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
chruby ruby-2.1.2
EOF
  mode "0644"
end

bash "install bundler" do
  code "/opt/rubies/ruby-2.1.2/bin/gem install bundler --no-ri --no-rdoc"
  not_if "/opt/rubies/ruby-2.1.2/bin/gem list | grep -w bundler"
end
