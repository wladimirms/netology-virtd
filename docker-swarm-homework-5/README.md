##Домашнее задание 6. Оркестрация кластером Docker контейнеров на примере Docker Swarm

# Задание 1
1. Создаю 3 виртуальные машины из образов c докер, ранее загруженых в YC при помощи packer:

<img width="1351" alt="Снимок экрана 2024-07-24 в 22 24 17" src="https://github.com/user-attachments/assets/aa8575e6-ad78-4d88-9796-73fbcda9c231">

Во время создания ВМ использую сеть и подсеть, созданную вручную через интерфейс YC:

<img width="585" alt="Снимок экрана 2024-07-24 в 22 27 00" src="https://github.com/user-attachments/assets/01e059bb-1f81-4c0d-bbe8-7eca999911ee">

2. Проверяю доступность машин и инициирую swarm кластер на менеджере:

<img width="1218" alt="Снимок экрана 2024-07-24 в 22 28 34" src="https://github.com/user-attachments/assets/8d49c145-eda7-412e-b714-b0aa52ce8181">

3. На воркер машинах 1 и 2 использую join:

<img width="1404" alt="Снимок экрана 2024-07-24 в 22 29 56" src="https://github.com/user-attachments/assets/ce68fe4f-d41b-4a55-b766-f347bfe3237e">

4. На менеджере проверяю состав swarm кластера

<img width="965" alt="Снимок экрана 2024-07-24 в 22 31 56" src="https://github.com/user-attachments/assets/7fba2db0-2054-47b7-8dea-e057260aecf5">
