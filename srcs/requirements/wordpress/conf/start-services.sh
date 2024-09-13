#!/bin/bash

sudo systemctl start apache2

sudo systemctl enable apache2

# Start Apache in the foreground
apache2ctl -D FOREGROUND
