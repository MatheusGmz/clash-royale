import urllib.request
import json
from urllib.request import urlopen
from robot.api.deco import keyword
import csv
import urllib.parse
import Logger


@keyword('Find Clan Tag')
def find_clan_tag(base_url, name, partialTag, key):
  decoded = urllib.parse.quote(str(name))
  result = urllib.request.Request(base_url+f"/clans?name={decoded}&locationId=57000038", None, {
      "Authorization": "Bearer %s" % key
  })

  response = urllib.request.urlopen(result).read().decode("utf-8")
  data = json.loads(response)
  for item in data["items"]:
      if item["tag"].find(partialTag):
       return item["tag"]

@keyword('Find Clan Members')
def find_clan_members(base_url, tag, key):
    decoded = urllib.parse.quote(str(tag))
    result = urllib.request.Request(base_url + f"/clans/{decoded}", None, {
        "Authorization": "Bearer %s" % key
    })
    response = urllib.request.urlopen(result).read().decode("utf-8")
    data = json.loads(response)
    return data

@keyword('Register Clan Members')
def register_clan_members(players):
  with open('Log/players.csv', 'w', encoding="utf-8") as csvfile:
    spam_reader = csv.writer(csvfile, quotechar='|', quoting=csv.QUOTE_MINIMAL)
    for member in players["memberList"]:
      rowToInsert = "Nome: %s Nível: %d Troféus: %d Papel: %s" % (member["name"], member["expLevel"], member["trophies"], member["role"])
      spam_reader.writerow(rowToInsert)

@keyword ('Find Ip')
def find_external_ip():
    ipAddress = urlopen('https://ident.me').read().decode('utf-8')
    return ipAddress

@keyword('Register Info')
def register_info(message):
    Logger.log.info(message)


@keyword('Register Error')
def register_error(message):
    Logger.log.ERROR(message)