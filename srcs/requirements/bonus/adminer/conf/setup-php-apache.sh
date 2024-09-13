#!/bin/bash

# Enable PHP in Apache and restart the server
a2enmod php
service apache2 restart
