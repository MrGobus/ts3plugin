# Плагин для TS3 отслеживающий активность пользователей на канале во время прайма гильдии в игре Archeage.

## Нужный код

Получает и выводит список id пользователей на текущем канале.

```javascript
anyID clientID;
uint64 channelID;
anyID* clients;

if (ts3Functions.getClientID(serverConnectionHandlerID, &clientID) == ERROR_ok) {
  if (ts3Functions.getChannelOfClient(serverConnectionHandlerID, clientID, &channelID) == ERROR_ok) {
    if (ts3Functions.getChannelClientList(serverConnectionHandlerID, channelID, &clients) == ERROR_ok) {
      anyID* client = clients;
      while(*client) {
        char buffer[2048];
        sprintf(buffer, "%ul", *client);
        ts3Functions.printMessageToCurrentTab(buffer);
        client++;
      }
      ts3Functions.freeMemory(clients);
    }
  }
}
```

# ToDo

- [x] Почистили исходник примера плагина выпилив все ненужное.
- [x] Определить событие отвечающее за вход пользователя на канал (ответ: `ts3plugin_onClientMoveEvent`).
- [x] Оказалось, что перенос вызывает отдельный эвент `ts3plugin_onClientMoveMovedEvent` вместо `ts3plugin_onClientMoveEvent`
- [ ] Понять как получить список пользователей на канале.
