# Test for Optimy

- copy the private key I sended you by email in the directory you just cloned

- create the following env vars, with the values of your aws account

(on linux)

export AWS_ACCESS_KEY_ID="AKIA................"

export AWS_SECRET_ACCESS_KEY="+GiNB8D................................."

(on windows cmd)

set AWS_ACCESS_KEY_ID=AKIA................

set AWS_SECRET_ACCESS_KEY=+GiNB8D.................................

run:

- terraform init
- terraform plan
- terraform apply

you should see as output something like:
optimy_instance_public_ip = 52.47.194.144

use the ip to open:

http://optimy_instance_public_ip/test.php
