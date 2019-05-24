import requests

#Print 1 if server is up and 0 when server is down
page = requests.get('http://localhost:8000/')
if page.status_code == 200:
    print 1
else:
    print 0
