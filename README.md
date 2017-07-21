#### Simple Habitat example plan to run a hello world go program #####

* Setup

		$ hab setup

* Build Artifact

		$ git clone https://github.com/abhijith/habitat-example.git
		$ cd habitat-example
		$ hab pkg build .

* Install

		$ sudo cp ~/.hab/cache/keys/<origin>-<timestamp>.pub /hab/cache/keys/ # skip uploading key to https://bldr.habitat.sh/ and test locally
		$ sudo hab pkg install results/<origin-hello-timestamp>.hart

* Start

		$ sudo adduser --group hab
		$ sudo useradd -g hab hab
		$ sudo hab svc start <origin>/hello

* Apply config change

		$ echo 'version = 2' | sudo hab config apply hello.default 1

* Build docker image

		$ sudo hab pkg export docker <origin>/hello

* Run docker image

		$ docker run -it <origin>/hello
