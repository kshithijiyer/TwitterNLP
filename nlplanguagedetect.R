#NLP twitter Language Detection 

#Description:
#In this R Script we'll be trying to fetch data from twitter based on hashtags
#and will also try to detech the language used in the tweets.

#Authors:Nidhi Pillai and Kshithij Iyer

#Date: 23/9/2017

#Contact: 
#nidhi.pillai9@gmail.com 
#kshithijiyer@yahoo.co.in

#Settings for Twitter Application Credentials
consumer_key<-'5WEMduxG9eQii00obst2zdXpj'
consumer_secret<-'n9iu6lsdPXsvzseCdGjV2Sl34ZTJ7RBPLLcaA9VLny4ZyIIIyI'
access_token<-'796761081389662209-ePm8RL9GH0BXaROYpZriFRotMaa1Y35'
access_token_secret<-'CshNpCSNfjDLmgKesx3C9kmqPkD9bYVtu0jSJEMnSx2ty'

#Data extraction settings
search.string <- "#edm"
no.of.tweets <- 100

#Importing libraries 
library("twitteR")
library("ROAuth")
library("textcat")
library("httr")


#Connecting to twitter and fetching
setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_token_secret)
tweets <- searchTwitter(search.string, n=no.of.tweets)
tweets
tweets.text <- sapply(tweets,function(x)x$getText())
tweets.text <- gsub("\n", "", tweets.text)
tweets.text <- gsub("\r", "", tweets.text)
tweets.text <- gsub("RT", "", tweets.text)
tweets.text <- gsub("@\\w+:", "", tweets.text)
tweets.text <- gsub("@\\w+", "", tweets.text)
tweets.text <- gsub("/\\w+", "", tweets.text)
tweets.text <- gsub("#\\w+", "", tweets.text)
tweets.text <- gsub("[ |\t]{2,}", "", tweets.text)
tweets.text <- gsub("http\\S+\\s*", "", tweets.text)
tweets.text <- gsub("^", "", tweets.text)
tweets.text <- gsub("_", "", tweets.text)
tweets.text <- gsub("|", "", tweets.text)
tweets.text <- gsub("-", "", tweets.text)
tweets.text <- gsub("-", "", tweets.text)
tweets.text <- gsub(";","", tweets.text)
tweets.text <- gsub(":", "", tweets.text)
tweets.text <- gsub("&\\w+", "", tweets.text)
tweets.text <- gsub("[\\]", "", tweets.text)
tweets.text <- gsub("[//]", "", tweets.text)
tweets.text

#test_data=tweets.text[1:10]

my.profiles <- TC_byte_profiles[names(TC_byte_profiles)]
my.profiles




tc=textcat(tweets.text, p = my.profiles)
tc

txtcat_df=data.frame(tweets.text,tc)
txtcat_df




library('cld2')


cld2_output=detect_language_mixed(tweets.text)
cld2_output

cld2_output2=detect_language(tweets.text, plain_text = FALSE, lang_code = FALSE)
cld2_output2

cld2_df=data.frame(tweets.text,cld2_output2)
final_df=data.frame(txtcat_df,cld2_output2)
View(final_df)




#classification
eng_vector=cld2_df$cld2_output2=='ENGLISH'
#eng_vector=na.omit(eng_vector)
eng_vector

df_eng_non=data.frame(tweets.text,cld2_output2,eng_vector)
df_eng_non
View(df_eng_non)


library('rpart')
library('rpart.plot')
rpart(cld2_output2~eng_vector,df_eng_non)
rpart.plot(rpart(cld2_output2~eng_vector,df_eng_non))

