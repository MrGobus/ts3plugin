# Плагин для TS3 отслеживающий активность пользователей на канале во время прайма гильдии в игре Archeage.

## Требования

Для сборки требуется MinGW64 либо умелые ручки.

## Файл настроек.

Файл настроек хранится в папке с плагином.

Название файла: `plugin_win64.json`

Раздел `channels` содержит список названий каналов для мониторинга с родительскими каналими через '/'

```json
{
	"channels" : [
		"llllllll/[cspacer] ▼/ОБЩИЙ РЕЙД",
		"llllllll/[cspacer] ▼/Команда АЛЬФА"
	]
}
```

## Полезное.

### Эвенты отвечающие за вход и выход пользователей на канал.

* `ts3plugin_onClientMoveEvent` - переход
* `ts3plugin_onClientMoveMovedEvent` - перетаскивание

### Получает и выводит список id пользователей на текущем канале.

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
- [x] Определить событие отвечающее за вход пользователя на канал
- [x] Понять как получить список пользователей на канале.
- [x] Прочитать файл настроек.
- [x] Получить список каналов из файла настроек, распарсить на составляющие и получить id каналов.
- [ ] Начать следить за каналами.
