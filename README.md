
# Devops for programmers project. Level 3: Terraform

### Hexlet tests and linter status:
[![Actions Status](https://github.com/strangeman/devops-for-programmers-project-lvl3/workflows/hexlet-check/badge.svg)](https://github.com/strangeman/devops-for-programmers-project-lvl3/actions)

## Описание проекта

Данный проект создает инфраструктуру (2 сервера, LB, кластер БД) для деплоя отказоустойчивой инсталляции Redmine

## Структура проекта

* `ansible` - плейбуки Ansible для деплоя приложения
* `terraform` - план Terraform для деплоя сопутствующей инфраструктуры

## Как запустить

* `make init` - инициализировать Terraform
* `make plan` - показать план выполнения Terraform
* `make plan-local` - показать план выполнения Terraform с оверрайдом переменных из файла `terraform/secret.tfvars` (полезно для локальной разработки, чтобы постоянно не лазать в tf cloud)
* `make deploy` - выполнить деплой инфраструктуры и приложения с помощью Terraform и Ansible local provisioner

## Переменные, которые необходимо установить для работы

* `do_token` - API токен для DigitalOcean, позволяющий создавать и удалять инфраструктуру
* `pvt_key` - путь до приватного SSH-ключа. Публичный ключ должен быть добавлен в DigitalOcean и быть установлен в свойстве `digitalocean_ssh_key.terraform`. Используется для запуска Ansible на серверах
* `cloudflare_email` - email аккаунта в Cloudflare, используется для доступа через API
* `cloudflare_api_token` - API токен аккаунта в Cloudflare. Токен должен иметь права на добавление и удаление DNS-записей
* `datadog_api_key` - API токен аккаунта в DataDog
* `datadog_app_key` - ключ приложения в DataDog, позволяющий добавлять и удалять алерты
