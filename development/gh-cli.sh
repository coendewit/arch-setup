az login
gh auth login --hostname github.com
gh auth login --hostname databalk.ghe.com

mkdir -p ~/dev/databalk/
mkdir -p ~/dev/tcr-it/

git clone databalk@databalk.ghe.com:DataBalk/1.1.Vastgoedtabel.git ~/dev/databalk/vgt
git clone databalk@databalk.ghe.com:DataBalk/1.1.Vastgoedtabel-Resub.git ~/dev/databalk/pubsub/
make ~/dev/databalk/pubsub/Makefile set-secrets

git clone git@github.com:coendewit/emailbroker-go.git ~/dev/tcr-it/emailbroker-go
