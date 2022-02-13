
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
