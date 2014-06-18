bash "install go" do
  code "set -o pipefail; wget -O - http://golang.org/dl/go1.3rc2.linux-amd64.tar.gz | tar -C /usr/local -zxf -"
  creates "/usr/local/go"
end

file "/etc/profile.d/go.sh" do
  content "export GOPATH=\"$HOME/go\"\nexport PATH=\"$PATH:$GOPATH/bin:/usr/local/go/bin\""
  mode "0644"
end
