# homework 02 
# Pao Ying Chub

print("Welcome to Pao Ying Chub Game")
choice <- c("h", "s", "p")
# Get name
print("What's your name?")
player_name <- readLines("stdin", n=1)
print(paste("Hi", player_name))

# Result l=lose, w=win, d=draw
result <- as.vector(NULL)

# PlayerChoose
print("Choose (h)ammer, (s)cissors, (p)aper, (q)uit")
player <- tolower(readLines("stdin", n=1))

while(player != 'q'){
if (any(player %in% choice)){
#ramdom Computer Choose
com <- sample(choice, size = 1)
  
print(paste(player_name, "=>", player, "Computer =>", com))
  
#check result
ifelse(player == com, {print("Draw!") 
                      result <- append(result, "d")}, 
  ifelse(player == "h" & com == "s"|
         player == "s" & com == "p"|
         player == "p" & com == "h",{
        print(paste(player_name, "win!"))
        result <- append(result, "w")} ,{
        print(paste(player_name, "lose!"))
        result <- append(result, "l")})   
      )
# PlayerChoose
print("Choose (h)ammer, (s)cissors, (p)aper, (q)uit")
player <- tolower(readLines("stdin", n=1))
   }
  else{
  print("Please choose 'h' 's' 'p' 'q' ")
  player <- tolower(readLines("stdin", n=1))
  }
}

#Summary Result
print(paste(player_name, "play:", length(result), 
                         ",Win:", length(which(result=="w")), 
                         ",Lose:", length(which(result=="l")), 
                         ",Draw:", length(which(result=="d"))))

print(result)