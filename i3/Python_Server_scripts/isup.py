import requests

#Print 1 if server is up and 0 when not
page = requests.get('http://localhost:8000/')
#print page.status_code
if page.status_code == 200:
    print 1
else:
    print 0
