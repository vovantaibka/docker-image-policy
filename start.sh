#!/bin/bash
pm2 serve . 80 --watch
exec $@
