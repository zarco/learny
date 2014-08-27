# README #

This README would normally document whatever steps are necessary to get your application up and running.

### What is this repository for? ###

* Quick summary
* Version
* [Learn Markdown](https://bitbucket.org/tutorials/markdowndemo)

### How do I get set up? ###

* Summary of set up
* Configuration
The following env variables must be set 


```
#!shell script

S3_KEY
S3_SECRET
S3_REGION
S3_BUCKET_NAME
S3_ASSET_URL

```
It is recomended to make a copy of the file named env_setup.sh.example and customize it. Once this copy has been created, it could be executed as source in order to set the enviroment


```
#!shell script

. ./env_setup.sh
```


Notice the dot and the space to execute the script as source and keep the values of the env variables, even the execution has finished

* Dependencies
* Database configuration

```
#!shell script

bundle exec rake db:migrate
```


* How to run tests

```
#!shell script

bundle exec cucumber
```



```
#!shell script

bundle exec rspec

```
* Deployment instructions

### Contribution guidelines ###

* Writing tests
* Code review
* Other guidelines

### Who do I talk to? ###

* Repo owner or admin
* Other community or team contact