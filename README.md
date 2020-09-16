# Ella Dev Stack

Create a development stack for - http://allel.es/. 

This is a WIP and should not be used for anything important!

## Docker Images

I built the docker images using the instructions from the Makefiles [ella](https://gitlab.com/alleles/ella) and [ella-anno](https://gitlab.com/alleles/ella-anno) repos and pushed those to Dockerhub. 

## Demo Instance

The dev instance is exactly the same as the demo instance provided by the main [ella repo](https://gitlab.com/alleles/ella). It's only included here for the sake of demonstration and as a starting point. It includes a preconfigured database, example users, along with example genepanels and annotated VCFs. 

### Run the Demo Instance

```
./run-demo.sh
```

Wait about a minute and you should see a message to open your browser.

Then open your browser at [http:localhost:5000](http://localhost:5000) in order to view the instance. You can login with any of the dev users. 

### Kill the demo instance

```
cd demo
docker-compose stop
docker-compose rm -f -v
```

## Dev Instance

This instance is meant to use the demo as a starting point, but import some example data manually to make sure I know what I'm doing.

### Run the Dev Instance

```
./run-dev.sh
```

Wait about a minute and you should see a message to open your browser.

Then open your browser at [http:localhost:5000](http://localhost:5000) in order to view the instance. You can login with `testuser1/demo`. 

### Kill the dev instance

```
cd demo
docker-compose stop
docker-compose rm -f -v
```
