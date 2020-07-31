#!/bin/sh

gunicorn --certfile cert.pem --keyfile key.pem -w 2 -b 0.0.0.0:8080 --error-logfile gunicorn.error.log --access-logfile gunicorn.log ddosSim:app
#gunicorn -w 2 -b 0.0.0.0:8080 ddosSim:app

#export FLASK_APP=ddosSim.py
#export FLASK_ENV=development
#flask run -h 0.0.0.0 
