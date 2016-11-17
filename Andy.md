# UML:
A [UML diagram](https://drive.google.com/file/d/0B784Gd1vTJZJWThvbk9fS0N1c1U/view?usp=sharing "Title") for this project(incomplete).

# User stories:

-----------------------------------------------------------------------------------------
# Plan:
## Get points button
- If the user is within the range of 0.3 km, the "finish challenge" button will be enabled.
- If the user is not within the range of 0.3 km and logged in, the "finish challenge" button will show and it is disabled. 
    - There is a "Please go to the restuarant" message shown to the user.
- If the user is logged in, within the range and it is the first time he clicks the "finish challenge" button, add points.
    - If the user is logged in, within the range and it is the first time he clicks the "finish challenge" button, 
- If the user is not logged in,within the range and click the "finish challenge" button, the app wil direct him/her to the sign up page. There will be a "Please sign up to save your points" message in the sign up page.
        - If the user sign up successfully, the app will direct him/her to the profile page, in which the points and restuarant history is added.
- In success page, if the user is logged in && bool(get_points_or_not) == true, add points to the user and then change the bool. [how about a counter]
- If the user click the finish button then go back to the accept page, there will be a notification.
- After 5 seconds in the success page, user will be redirected back to profile page.

## Resturant histories
- When the user completes a challenge and clicks the "check in" button, the restaurant that they visited will be saved
	- On their profile page, the user will be able to see the name and photo of all the restaurants they have visited in a list
	- Restaurants visited multiple times will be displayed seperately
	- The time that the user finishes the challenge will be stored and displayed in the history


