# SSHUbuntu

Simple Ubuntu docker images with SSH access (based on tutum/ubuntu)

## Building
To create the image execute the following command:

`docker build -t myUbuntuNameGoesHere .`

## Running sorrell/sshubuntu
To run a container from the sorrell/sshubuntu image and bind it to port 2222 in all interfaces, execute:

`docker run -d -p 0.0.0.0:2222:22 sorrell/sshubuntu`

The first time that you run your container, a random password will be generated for user root. To get the password, check the logs of the container by running:

`docker logs <CONTAINER_ID>`

You will see an output like the following:

```sh
========================================================================
You can now connect to this Ubuntu container via SSH using:

    ssh -p <port> root@<host>
and enter the root password 'U0iSGVUCr7W3' when prompted

Please remember to change the above password as soon as possible!
========================================================================
In this case, U0iSGVUCr7W3 is the password allocated to the root user.

Done!
```

## Setting a specific password for the root account
If you want to use a preset password instead of a random generated one, you can set the environment variable ROOT_PASS to your specific password when running the container:

`docker run -d -p 2222:22 -e ROOT_PASS="mypass" sorrell/sshubuntu`

## Adding SSH authorized keys
If you want to use your SSH key to login, you can use AUTHORIZED_KEYS environment variable. You can add more than one public key separating them by ,:

`docker run -d -p 2222:22 -e AUTHORIZED_KEYS="``cat ~/.ssh/id_rsa.pub``" sorrell/sshubuntu`