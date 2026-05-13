# TP-lab08

Лабораторная работа №8 по ТиМП.

## Описание

Проект изучает Docker.

В Dockerfile собирается CMake-проект из предыдущей лабораторной работы.

Контейнер запускает приложение `demo`.

Приложение читает текст из stdin и пишет его в файл `log.txt`.

## Сборка Docker-образа

```bash
docker build -t logger .
```

## Запуск контейнера

```bash
mkdir -p logs
docker run -i -v "$(pwd)/logs:/home/logs" logger
```

## Проверка результата

```bash
cat logs/log.txt
```

## Структура

- `Dockerfile` — инструкция сборки Docker-образа
- `.dockerignore` — исключения для Docker build context
- `.github/workflows/docker.yml` — проверка сборки Docker-образа
- `demo/` — приложение для записи логов
