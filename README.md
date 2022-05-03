# Jobs






postgresql

```sh
brew install postgresql
brew services list
brew services start postgresql
brew services status postgresql

rm -rf /usr/local/var/postgres
initdb --locale=C -E UTF8 /usr/local/var/postgres

createuser --superuser postgres -P
/usr/local/opt/postgres/bin/createuser -s postgres
```


```sh
mix deps.get
mix ecto.setup
iex -S mix phx.server
```