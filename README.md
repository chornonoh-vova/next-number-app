# next-number-app

## Prerequisits

- [virtualbox](https://www.virtualbox.org/wiki/Downloads) - version 5.2.14 at the moment of writing
- [vagrant](https://www.vagrantup.com/downloads.html) - version 2.1.2 at the moment of writing
- vbguest plugin `$ vagrant plugin install vagrant-vbguest`

## Run

- Clone repository:
`$ git clone https://github.com/hbvhuwe/next-number-app.git`
- Navigate to project's folder:
`cd next-number-app`
- Run `vagrant up`

## Get a result

- Via netcat one number: `nc localhost 8080 <<< "next number"`
- In interactive mode: `nc localhost 8080`
