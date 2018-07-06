# next-number-app

## Prerequisits
- To run with Vagrant:
  - [virtualbox](https://www.virtualbox.org/wiki/Downloads) - version 5.2.14 at the moment of writing
  - [vagrant](https://www.vagrantup.com/downloads.html) - version 2.1.2 at the moment of writing

- To run with Docker
  - [docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/) - version 18.03 at the moment of writing
  - [docker-compose](https://github.com/docker/compose/releases) - version 1.22.0-rc2 at the moment of writing
  
## Run

- Clone repository: `$ git clone https://github.com/hbvhuwe/next-number-app.git` or download [zip](https://github.com/hbvhuwe/next-number-app/archive/master.zip) and unpack it
- Navigate to project's folder: `cd next-number-app` or `cd <unpacked-folder-path>`
- With Vagrant:
  - Run `vagrant up`
  - Stop `vagrant halt` to poweroff machine or `vagrant suspend` to save machine state
- With Docker:
  - Build and start `./docker --start`
  - Stop `./docker --close`

## Get a result

- Via netcat one number: `nc localhost 8080 <<< "next number"`
- In interactive mode: `nc localhost 8080`
