# internet-speedtest-docker

__**Spoiler Alert**__

This project won't help you with your connection, actually this project born when I need to monitoring the speed of my Internet, create a report to send to my ISP, so they can take some action. Using **Docker Compose** I put together three containers with the tools needed to monitoring and display the status of your Internet (and I know that tool can do more or can be better).

Here in Brazil is a mess to contract a good ISP, they just don't deliver the speed they should for the users. Generally in a small business or a residence you can't pay for a very expensive plans where they certify the bandwidth delivered. So you have to call them many times complaining about the speed of your internet connection and always they will ask you to do that Internet Tests Online, such as [SpeedTest](http://www.speedtest.net), [AT&T SpeedTest](http://www.att.com/speedtest/), [TestMyNet](http://testmy.net), most of these tests are based only on ICMP messages that don't reflect your real bandwidth at that time. Or even worse your ISP can allow all trafic ICMP so when you test it appears that you have a good speed but when you have to download some content you can't do it that well. There is much more to talk about it but I don't wanna spend so much time talking about the things that are wrong here.

<p align="center"><img src="https://dl.dropboxusercontent.com/s/l0py4zgi5izcbgw/Screen%20Shot%202017-02-27%20at%2023.55.16.png"Grafana"></p>

## Running container
The only requirement to run this compose is have Docker Compose installed, if you need to install you can [click here](https://docs.docker.com/compose/install/) to check out how can you do that. After installed the only thing you need is export the variables that you like and configure the volume for persistent data, then run the compose as command available below:

```console
$ git clone https://github.com/pedrocesar-ti/internet-speedtest-docker.git
$ cd internet-speedtest-docker

$ docker-compose up -d 
```

## Docker Compose
As you probably know Docker Compose is a tool to let you running a multi-container application, so as I sad before I put together some contaiers to make everything work together. They are described below:

### InfluxDB (DB)
InfluxDB is a database tool based on time-series, so every event is registrate with their timestamp. I decided to use InfluxDB at first because has great integration with Grafana and second I don't take cara about timestamp and how generate the graphs based on time.

<p align="center"><img src="https://dl.dropboxusercontent.com/s/u8urqvu85ob8zdn/Screen%20Shot%202017-02-28%20at%2000.03.36.png"InfluxDB"></p>

This project uses the official InfluxDB image hosted in the Docker Hub Library.

You can edit or remove the volumes section of the docker-compose.yml file to reflect where you want you persistent data to live, or you can remove it if you like.   If you remove the volume mount you will lose all of your data if the container is removed.

```docker-compose.yml
services:
  db:
    image: influxdb 
    container_name: influxdb
    volumes:
      - "/data/influxdb/:/var/lib/influxdb"
```

You can customize some actions with variables listed below:

| Variables  | Default | Function |
|---------|--------|--------|
| **INFLUXDB_ADMIN_USER** | admin | Set root user for the database. |
| **INFLUXDB_ADMIN_PASSWORD** | password | Set the password for the root user. |
| **INFLUXDB_DB** | speedtest | Create a database **speedtest** when container starts. |


### Grafana (Web)
Grafana is a tool to create and manage dashboards and graphs. It's a really cool tool and as I said earlier has a perfect integration with InfluxDB.

When I started this project I used [tutumcloud/grafana](https://github.com/tutumcloud/grafana) image, however they stopped to update grafana image beacause the new version has a different way to be installed, so it's deprecated. So I used [grafana](https://hub.docker.com/r/grafana/grafana/) original image as a base system to generate my own image.

You can also customize this image with few variables:

| Variables  | Default | Function |
|---------|--------|--------|
| **GF_SERVER_ROOT** | http://localhost | Set URL to configure Grafana built-in web server. |
| **GF_SECURITY_ADMIN_PASSWORD** | **Default without password.** | This is a password to access the Grafana Dashboard. |


### SpeedTest (Testing)
This image was created to run a script that calls speedtest-cli to test the internet connect and save data on InfluxDB. [SpeedTest](https://github.com/sivel/speedtest-cli/) is a tool written in Python and is used to test your Internet connection based on download and upload some content from servers configured previously (in average this test takes around 30 sec, at least in my case).

The only variable to customize on this image is a variable to set the frequency that this script will run in seconds. So if you need your test to run every minute, change the variable to 60 seconds. Just bear in mind that the speed test execution time will be added on top of the test interval so you might end up with data points every 1 minute and something. 

If you are using docker-compose to standup you stack you can easily change the variable value on the [env/testing.env](./env/testing.env) file.

| Variables  | Default | Function |
|---------|--------|--------|
| **TEST_INTERVAL** | 5 | Time (in sec.) to set how long will sleep the script until run again. |


Repositories used to
---------------------------------

* [influxdb](https://hub.docker.com/_/influxdb/) 
* [Grafana](https://hub.docker.com/r/grafana/grafana/)
* [SpeedTest](https://github.com/sivel/speedtest-cli/)

Enjoy! :)

