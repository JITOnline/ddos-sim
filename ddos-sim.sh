#!/bin/sh

gunicorn -w 2 -b 0.0.0.0:5000 ddosSim:app

#export FLASK_APP=ddosSim.py
#export FLASK_ENV=development
#flask run -h 0.0.0.0 
