
# XD-276project
# Rand & Run
## Project Proposal

Everyone has had the problem of wondering what to eat for dinner. Whether they are with friends, or alone, many have spent many minutes to even hours agonizing for the right restaurant to go to. These people would usually look towards websites such as Yelp or Zomato to find lists of many restaurants that may suit their choice, however, this can lead one to be paralyzed by choice, or disagreements between friends on where and what to eat. Our app, Rand & Run, aims to solve this dilemma in a novel way.

Rand & Run is a restaurant finder with a twist. When prompted, our application will give the user one random restaurant taken from a list of recommended ones based on their geographical location. Upon receiving this restaurant, the user is given 24 hours to go to it. If they do, they can sign onto the app on their phone, and notify it that they have arrived, for which they will receive points. With this, we hope to remove uncertainties and arguments over what to eat by only giving one choice, and we will give incentive to actually go to the restaurant by giving out points, making it like a game.

Our app will feature many things such as a ranked global leaderboard showcasing who has the most points, the ability to share your point status on social media, and specialized website aesthetics for the user based on his or her points. A user will be able to specify some things about what they want such as a max distance and a price range.  When a user is given a random restaurant, they will be able to see the location on a map, along with their own location. Of course, this means that the app will be mobile friendly. In addition to this, we are looking to include other extra features such as more things to do with your points.
	
As outlined above, we hope that the main users of this project will be the average person who can relate to having trouble figuring out what to eat or do. Many people resort to doing things such as choosing random restaurant names out of a hat, and we are hoping that this app can replace that, along with improving the experience. With the huge success of Pokemon Go this past summer, we can see that people are very open to the idea of location based mobile games, and we are looking to this proven concept to also leverage our app. We will design our app to be accessible to as many people as possible, making it easy to read and simple to work with. Other than the main users, admins of the site will be able to see and manage all the users in the system.
	
To accomplish this project, we are going to have to utilize a number of APIs from various companies. Yelp and Google Maps APIs will probably be the backbone of the app, with their restaurant finding and geographical locator features respectively. In order to implement social features, we will also need to utilize the APIs of Facebook and Twitter.

By creating Rand & Run, we are looking to attract users by being simple to use with sleek, minimalistic UI. Although there are many restaurant finders out there, Rand & Run is unique with its location based gameplay implementation, and we hope that we can make Friday nights a little more fun for everyone with a fun way of solving a common problem.

# User stories:
## Account system:
*   Account system
    *   []  As a user, I can sign up with my email. 
        *   [] If user input the wrong format of email, there will be a specific error message to ask them to type again 
        *   [] Confirmation of the account password. If it doesn't match the password, there will be a specific error message to ask them to type again
        *   [] The password should have a minimal length of 6. If user input a password with length less than 6, there will be a specific error message to ask them to type again
        *   [] If the email or account name is already exist, there will be a specific error message to ask them to type again
            *  [] **optional** test the user name exists or not
        *   [] **optinoal** The user sign up successfully will receive a activation email to activate the account
    *   []  As a user with an account, I can log in with the correct email and password.
        *   [] If the email or password doesn't match, there will be a specific error message to ask them to type again
        *   [] If user input the wrong format of email, there will be a specific error message to ask them to type again 
        *   [] The password should have a minimal length of 6. If user input a password with length less than 6, there will be a specific error message to ask them to type again
    *   []  As a user, I can change my password when I forget my password
        *   []  Send a change password link to the user email when user forget the password. 
        *   []  **Optional** What if users forget their account(email)
    *   []  Use cookies to remember user's email so they don't have to type it every time
        *   []  Provide a "remember my account" checkbox option in the log in page
        

