import json
from pprint import pprint

with open('radio-ngrok.json', encoding='utf-8') as data_file:
    data = json.loads(data_file.read())

radiodelicias=data['public_url']+"/radio-delicias.mp3"

audioBefore="""<audio id="player" preload="auto" controls autoplay >"""
source = "<source src='%s' type='audio/mpeg'>" % (radiodelicias)
audioAfter ="""</audio>"""

finishAudio=audioBefore+source+source+source+source+source+source+source+audioAfter

f = open('audio.txt','w')
 
f.write(finishAudio)
f.close()

filenames = ['file1.txt','audio.txt', 'file3.txt']
with open('index.html', 'w') as outfile:
    for fname in filenames:
        with open(fname) as infile:
            outfile.write(infile.read())
