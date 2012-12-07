## Rake tasks

Execute all tests
```shell
bundle exec rake
```

Creates all tables
```shell
bundle exec rake db:migrate
```

Import base data from ```./data/log/```
```shell
bundle exec rake import:log
```

Import upgrades from ```./data/delta/```
```shell
bundle exec rake import:delta
```

Creates a consolidated table cep_list
```shell
bundle exec rake import:join
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
