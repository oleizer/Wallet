source 'https://rubygems.org'

gem 'cocoapods'
# Библиотека типа Make но на Ruby
gem 'rake'
# Библиотека для папок  согласно группам
gem 'synx'
# Автоматическая установка и обновление xCode
gem "xcode-install"
# Кодогенерация
gem "generamba"
# Библиотека для удаления pod'ов из проекта
gem 'cocoapods-clean'
# Библиотека для удаления pod'ов из проекта
gem 'cocoapods-deintegrate'
# Быстрый и гибкий в настройки форматер для билдера Xcode
gem 'xcpretty'
# Расширение для xcpretty для работы с TravisCI для форматирования выходных логов
gem 'xcpretty-travis-formatter'
gem "xcpretty-json-formatter"
# Библиотека для работы с plist файлами. Возможность парить plist в Ruby нативные данные и обратно
gem 'plist'
# Добовление на иконку
gem "badge"
# Библиотека для работы с git
gem 'git'
# Библиотека для загрузки переменных из .env
gem 'dotenv'
# CI

# Библиотека для автоматической сборки версий
gem 'fastlane'
gem "danger"
gem "danger-xcov"
gem "xcov"
gem "artifactory"
gem "rubocop"

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)

