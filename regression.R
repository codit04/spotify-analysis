library(dplyr)
library(spotifyr)
Sys.setenv(SPOTIFY_CLIENT_ID = 'f0f5b79563b7458aab7448c498928a6d')
Sys.setenv(SPOTIFY_CLIENT_SECRET = '7e71f259fe37495d8acee92630fd5643')
artist1<-readline("Enter name of artist 1:")
artist2<-readline("Enter name of artist 2:")
artist1 <- get_artist_audio_features(artist1)
artist2<-get_artist_audio_features(artist2)

score1<-(artist1$danceability+artist1$energy)/2
speakability1<-(artist1$speechiness)
score2<-(artist2$danceability+artist2$energy)/2
speakability2<-artist2$speechiness
songs=data.frame(artist=1,speakability=speakability1,enjoyability=score1)
temp=data.frame(artist=2,speakability=speakability2,enjoyability=score2)
songs=rbind(songs,temp)
plot(songs$speakability,songs$enjoyability, 
     col = ifelse(songs$artist == 1, "blue", "red"),
     pch = ifelse(songs$artist== 1, 17, 19),
     main = " Enjoyability v Speakability",
     xlab = "Enjoyability",
     ylab = "Speakability")
legend("topleft", 
       pch = c(19, 17), 
       c("Artist1", "Artist2"), 
       col = c("red", "blue")) 
abline(lm(score1~speakability1), col = "red")
abline(lm(score2~speakability2), col = "blue")