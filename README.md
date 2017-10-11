# TwitterNLP
In this project we detected language of a given tweet through NLP packages and compared different packages avaliable for language detection.

## Prerequisites
1. R 3.x or Higher
2. RStudio 1.0.44 or Higher
3. [Twitter Application credentials](https://apps.twitter.com/app/new)
4. Good internet connection

## Installation and usage 
1. First run the ```installscript.r``` script and open the ```nlplanguagedetect.R``` script.
2. Now set the credentials as show below:
```
#Settings for Twitter Application Credentials
consumer_key<-''
consumer_secret<-''
access_token<-''
access_token_secret<-''
```
3. Now change the hastag and the number of tweets to be collected.
```
#Data extraction settings
search.string <- "#edm"
no.of.tweets <- 100
```
4. Run the script and you'll see the results on the screen.

## Built with 
[RStudio](https://www.rstudio.com/)

## Authors
[Nidhi Pillai](https://in.linkedin.com/in/nidhi-pillai-291544149)
 and [Kshithij Iyer](https://www.linkedin.com/in/kshithij-iyer/)

## Licence 
The project is released under apache 2.0 licence.
