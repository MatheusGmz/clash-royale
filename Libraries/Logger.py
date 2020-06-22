import os
import logging
import datetime

currentDirectory = os.getcwd() + '\\'
currentDate = datetime.datetime.now().strftime('%d%m%Y')

isdir = os.path.isdir(f'{currentDirectory}\\Log')
if (not isdir):
    os.mkdir('Log')

log = logging.getLogger()
fhandler = logging.FileHandler(
    filename=f'{currentDirectory}/Log/{currentDate}.log',
    mode='a')

formatter = logging.Formatter(
 '%(asctime)s - %(levelname)s - %(message)s')
fhandler.setFormatter(formatter)
log.addHandler(fhandler)
log.setLevel(logging.DEBUG)
