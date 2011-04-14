Scripts for the XGN demo on AWS Cloud Computing for Startups
============================================================

To use, just boot your instance with this user-data parameter:

    #!/bin/bash 
    curl https://github.com/amuino/xgn-cloud/raw/master/setup.sh | bash > /home/ubuntu/out 2> /home/ubuntu/err ; chown ubuntu:ubuntu /home/ubuntu/setup.*