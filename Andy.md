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

