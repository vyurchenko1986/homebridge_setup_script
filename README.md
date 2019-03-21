# Homebridge setup script

Итак, что же делает этот скрипт?

* Добавляет репозиторий nodejs 11.x
* Ставит `nodejs` и `libavahi-compat-libdnssd-dev`
* Через npm ставит `homebridge`
* Создает папку `.homebridge` в домашнем каталоге текущего пользователя
* Кладет туда файл конфигурации с данными для запуска веб-морды
* Ставит сам плагин веб-морды - `homebridge-config-ui-x`
* Ставит сам плагин eWeLink - `homebridge-ewelink-max`
* Создает `homebridge.service` и запускает его

Как итог, запустив этот скрипт хоть на впервые загруженном Raspberry Pi, имеющем доступ в сеть, через 5-7 минут Вы получите доступ к веб-морде homebridge по адресу http://homebridge.local:8080/ в локальной сети.

Для авторизации в веб-интерфейсе логин и пароль по умолчанию:

Login: admin

Password: admin

Для авторизации  по SSH логин и пароль:

Login: pi

Password: QY32SFyTQfaHDTKd


sudo apt install -y git

git clone https://github.com/vyurchenko1986/homebridge_setup_script.git

cd homebridge_setup_script

bash install.sh
