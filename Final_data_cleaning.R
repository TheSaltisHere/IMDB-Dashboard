gc()
library(dplyr)
library(readr)
library(writexl)
#MERGING SPLIT FILES

df1<- read.csv("D:/Projects and Practice/DS PROJECT/CSV FILES/split1.csv")
str(df1)
df2<- read.csv("D:/Projects and Practice/DS PROJECT/CSV FILES/split2.csv")
str(df2)
df3<- read.csv("D:/Projects and Practice/DS PROJECT/CSV FILES/split3.csv")
str(df3)
df4<- merge(df1,df2,by="X")
str(df4)
df5<- merge(df4,df3,by="X")
str(df5)
write.csv(df5,"D:/Projects and Practice/DS PROJECT/sample.csv")

df=read.csv("D:/Projects and Practice/DS PROJECT/sample.csv")

df
colnames(df)
str(df)

#CLEANING THE DATA
#REPLACING NA VALUES
df=df[,c(-1,-2)]
str(df)
df

#REPLACING STRING DATA BY MODE

Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

df$color[is.na(df$color)] <- Mode(df$color)
df$language[is.na(df$language)] <- Mode(df$language)
df$country[is.na(df$country)] <- Mode(df$country)
df$content_rating[is.na(df$content_rating)] <- Mode(df$content_rating)

nrow(df)
#REMOVING DATA WHERE DIRECTOR NAME IS NULL
df=df[complete.cases(df[ , 3]),]
nrow(df)

df
nrow(df)
#changing columns type to int

#REPLACING NUMERIC VALUES BY MEAN
df$num_critic_for_reviews[is.na(df$num_critic_for_reviews)]<-as.integer(mean(df$num_critic_for_reviews,na.rm=TRUE))
df$duration[is.na(df$duration)]<-as.integer(mean(df$duration,na.rm=TRUE))
df$director_facebook_likes[is.na(df$director_facebook_likes)]<-as.integer(mean(df$director_facebook_likes,na.rm=TRUE))
df$actor_3_facebook_likes[is.na(df$actor_3_facebook_likes)]<-as.integer(mean(df$actor_3_facebook_likes,na.rm=TRUE))
df$actor_1_facebook_likes[is.na(df$actor_1_facebook_likes)]<-as.integer(mean(df$actor_1_facebook_likes,na.rm=TRUE))
df$gross[is.na(df$gross)]<-as.integer(mean(df$gross,na.rm=TRUE))
df$num_voted_users[is.na(df$num_voted_users)]<-as.integer(mean(df$num_voted_users,na.rm=TRUE))
df$cast_total_facebook_likes[is.na(df$cast_total_facebook_likes)]<-as.integer(mean(df$cast_total_facebook_likes,na.rm=TRUE))
df$title_year[is.na(df$title_year)]<-as.integer(mean(df$title_year,na.rm=TRUE))
df$facenumber_in_poster[is.na(df$facenumber_in_poster)]<-as.integer(mean(df$facenumber_in_poster,na.rm=TRUE))
df$num_user_for_reviews[is.na(df$num_user_for_reviews)]<-as.integer(mean(df$num_user_for_reviews,na.rm=TRUE))
df$budget[is.na(df$budget)]<-as.integer(mean(df$budget,na.rm=TRUE))
df$actor_2_facebook_likes[is.na(df$actor_2_facebook_likes)]<-as.integer(mean(df$actor_2_facebook_likes,na.rm=TRUE))
df$imdb_score[is.na(df$imdb_score)]<-mean(df$imdb_score,na.rm=TRUE)
df$aspect_ratio[is.na(df$aspect_ratio)]<-mean(df$aspect_ratio,na.rm=TRUE)
df$movie_facebook_likes[is.na(df$movie_facebook_likes)]<-as.integer(mean(df$movie_facebook_likes,na.rm=TRUE))

sum(is.na(df$color))
#number of NA VALUES in the dataframe
for(i in colnames(df))
{
  print(i)
  print(sum(is.na(df$i)))
}
nrow(df)
str(df)

write_xlsx(df,"D:/Projects and Practice/DS PROJECT/final.xlsx")


