## Домашнее задание к занятию 4 «Оркестрация группой Docker контейнеров на примере Docker Compose»

# Задача 1

1.Создал Dockerfile, собрал и запустил на его основе контейнер локально на порту 8080:

<img width="249" alt="image" src="https://github.com/user-attachments/assets/79238301-b023-40a7-bb79-452c2ff76658">

<img width="251" alt="image" src="https://github.com/user-attachments/assets/d92fb9fc-c82d-460c-9898-b55d1f7c29ac">

<img width="251" alt="image" src="https://github.com/user-attachments/assets/de730578-33b3-40a4-aeb0-6ac03cd5a0fe">

2. Добавил образ в свой dockerhub-репозиторий:
https://hub.docker.com/repository/docker/wladimirmuravyev/custom-nginx/general

<img width="436" alt="image" src="https://github.com/user-attachments/assets/7b460028-859e-4d0e-9d83-02a3d8f6e8ce">

# Задача 2

1.Запустил контейнер custom-nginx в фоне с ФИО в названии контейнера на порту 8080, а затем переименовал его в custom-nginx-t2:

<img width="468" alt="image" src="https://github.com/user-attachments/assets/0a1ca8cb-533a-4d8a-8a01-61d778efcdf0">

2. Вывод в консоль команд. Я использую macOS, поэтому вместо ss решил просто вывести результат curl. Свои тестовые контейнеры nginx не удалял:

<img width="468" alt="image" src="https://github.com/user-attachments/assets/e7e5ef75-b8ad-4548-9438-f17e76743113">
 
3. Скриншот браузера по порту 8080 – 16 июля 21:56 с запущенным контейнером custom-nginx-t2

<img width="205" alt="image" src="https://github.com/user-attachments/assets/375b622d-f0a3-420e-ba31-7e7cf56fc905">
 
# Задача 3

1.Подключаюсь к стандартному выводу потоку ввода/вывода/ошибок для контейнера custom-nginx-t2 при помощи команды attach

<img width="435" alt="image" src="https://github.com/user-attachments/assets/03b76a64-610f-4c42-b042-524a1292ca84">
 
2.После ввода ctrl+C в данном режиме процессам посылается сигнал SIGINT, процессы завершаются и контейнер останавливается.

<img width="443" alt="image" src="https://github.com/user-attachments/assets/574b7b66-5f4b-4d87-bc3d-8641693f7612">
 
3. Запустив контейнер снова, захожу в него в интерактивном режиме, обновляю пакеты и устанавливаю nano:
 
<img width="435" alt="image" src="https://github.com/user-attachments/assets/ad707f6d-2882-4414-80a2-0fd42289685f">

4. Изменяю прослушиваемый порт 80 на 81 в конфиге nginx /etc/nginx/conf/default.conf и сохраняю:

<img width="266" alt="image" src="https://github.com/user-attachments/assets/264970bf-13b9-4f58-bcd0-770afc20470c">
 
5. Перезагружаю конфиг nginx и обращаюсь на порты 80 и 81

<img width="435" alt="image" src="https://github.com/user-attachments/assets/baac91d3-ebf5-48bf-9989-8a64b9c9db9d">
 
На этом этапе, видим что обращение по порту 80 теперь не отдает страницу, а по порту 81 - отдает.

6. Выйдя из контейнера, смотрим установленный порт для контейнера и обращемся по нему через curl. Получаем ошибку доступности, так как 80 порт более не прослушивается демоном nginx в контейнере, а следовательно и ничего не отдает на порт хостовой системы.

<img width="468" alt="image" src="https://github.com/user-attachments/assets/d4d82954-bd55-4254-8104-28d761071cfa">

7. Принудительно останавливаю и удаляю контейнер custom-nginx-t2 через docker rm с флагом --force

<img width="468" alt="image" src="https://github.com/user-attachments/assets/cb57caad-0abb-4918-9fa7-aa12cfc135f7">
 
# Задача 4

1.Скачиваю образы Centos 7 и Debian 11

<img width="468" alt="image" src="https://github.com/user-attachments/assets/6828aaf3-1092-4877-8601-1ab62eb96c79">

2. Запускаю из образов контейнеры с volume в текущем рабочем каталоге с монтированием к /data

<img width="468" alt="image" src="https://github.com/user-attachments/assets/2357c645-2e23-4740-b9a5-1517ac8abd74">
 
3.Захожу в первый контейнер и в /data создаю файл с содержимым в my-new-text.txt и выхожу из контейнера. Создаю файл my-second-text.txt с содержимым в хостовой директории. Захожу во второй контейнер и отображаю листинг существующих в volume файлов и их содержимого.

<img width="468" alt="image" src="https://github.com/user-attachments/assets/2e6abfc1-f0ba-4e50-9191-bcbcebd0aac3">

# Задача 5

1.Запускаю docker compose up. Создается контейнер из compose.yaml в режиме network_mode: bridge 

<img width="468" alt="image" src="https://github.com/user-attachments/assets/e8f0bacc-6788-4c1e-9a67-148b5d2ee3e9">

Это происходит потому что docker compose отдает предпочтение классическому манифесту compose.yaml согласно документации.

2. Меняю compose.yaml чтобы запускалось оба контейнера через include. В файле docker-compose.yaml меняю порты на 6000:5000, так как на хостовом Mac 5000 порт занят процессом. Не стал его убивать. Режим – bridge:

<img width="468" alt="image" src="https://github.com/user-attachments/assets/e3c265a0-c7af-46b2-b7a9-739ad90e191c">
 
3.Запускаю docker compose - запускаются оба контейнера

<img width="468" alt="image" src="https://github.com/user-attachments/assets/9e0eff54-ed2d-477f-ab98-a3dc40da6fea">

4. Деплою контейнер custom-nginx в локальное registry. Решил использовать тэг 1.21.1
 
<img width="468" alt="image" src="https://github.com/user-attachments/assets/e4cc4e6b-49c5-4f54-ab9d-5d0715992fdb">

5. Захожу в развернутый portainer через браузер, настраиваю аутентификацию и попадаю в веб-интерфейс. Перехожу на вкладки Home и stacks, создаю mystack:

<img width="468" alt="image" src="https://github.com/user-attachments/assets/30f1901f-ad67-44ff-acb4-8860ed62e548">
<img width="468" alt="image" src="https://github.com/user-attachments/assets/77f757ed-6e37-4a39-9d55-cdfe8225360a">
 
6.Вношу манифест в mystack и пытаюсь задеплоить контейнер custom-nginx с тэгом 1.21.1 из локального регистри на :6000 

<img width="468" alt="image" src="https://github.com/user-attachments/assets/6e171a91-151d-4eff-ab90-e8a32bfe7fa0">
 
7. Успешно задеплоил. Есть скриншот из inspect для контейнера и из браузера с работающим custom-nginx на порту 9090
 
<img width="468" alt="image" src="https://github.com/user-attachments/assets/67b8d37c-e414-421f-a5dc-a5b8e2d27fd7">
<img width="468" alt="image" src="https://github.com/user-attachments/assets/bd57a0a7-189f-4279-b570-9f4f471a0040">
<img width="277" alt="image" src="https://github.com/user-attachments/assets/d90c97a1-b35d-4f4a-b13d-86e3cabc321c">
 
8. Удалил compose.yaml и запустил compose up. Вывод из консоли:

<img width="468" alt="image" src="https://github.com/user-attachments/assets/50efa3b3-a156-4914-ad58-27e0a91851f5">

 
Далее объяснение ситуации из источника:
Compose использует имя проекта (которое по умолчанию является базовым именем каталога проекта) для внутренней изоляции проектов друг от друга. Имя проекта используется для создания уникальных идентификаторов для всех контейнеров проекта и других ресурсов. Например, если имя вашего проекта myappи он включает две службы dbи web, то Compose запускает контейнеры с именами myapp_db_1и myapp_web_1соответственно. Вы получаете "Found orphan containers" предупреждение, потому что docker-compose обнаруживает некоторые контейнеры, которые принадлежат другому проекту с тем же именем .

9. Гашу проект compose одной командой c использованием –remove-orphans:

<img width="468" alt="image" src="https://github.com/user-attachments/assets/9b20c470-2c2a-4eac-bfe8-ef0dbd141334">

