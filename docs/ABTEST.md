1. A/B Test Name: Quick-Cart Background Color Change (Green vs. Black)
User Story #6:
This A/B test falls under UI/UX enhancements for the Quick-Cart app. It aims to determine if changing the background color from green to black improves user engagement and retention.
Metrics:
The HEART metrics being measured include:
Engagement: Time spent on the app
Retention: Number of returning users
Task Success: User interaction with key app features


Hypothesis:
Problem: Users may find the green background too bright, causing eye strain or making text less readable.
Hypothesis: Changing the background to black will improve readability, reduce eye strain, and potentially increase user engagement and retention.
Experiment:
Setup: A remote config setup in Firebase is used to dynamically switch the background color from green (Control) to black (Variant).
Audience: A/B test will be rolled out to 50% of users to compare behavior between both color themes.
Tracking: Firebase Analytics will be used to measure time spent on the app, feature interaction rates, and return sessions.
Variations:
Control Group (A): Default green background
Variant Group (B): Black background
Mockups of both designs will be included for comparison. The final variation will be selected based on engagement and user feedback data.


2. A/B Test Name:
Navigation: Scrolling Between Screens vs. Bottom Navbar
User Story Number: US3
Metrics:
Engagement: Time spent on the app per session
Adoption: Number of screens viewed per session
Satisfaction: User feedback on ease of navigation

Hypothesis:
We believe that replacing the bottom navigation bar with scrolling between screens will reduce friction and result in a more fluid user experience, as users may prefer swiping rather than using a fixed navigation bar.
Problem & Impact:
Currently, the bottom navigation bar may feel restrictive or redundant when switching between screens. We believe that enabling scrolling between screens can streamline navigation and make the app feel more interactive. This could lead to higher user engagement and satisfaction, as users may enjoy the more fluid navigation.
Experiment Setup:
Audience: 50% will use the bottom navigation bar, and 50% will experience scrolling between screens.
Tracking:
screen_switches → Tracks how many times users switch between screens
time_spent → Measures how long users spend on the app
user_feedback → Collects user feedback on navigation ease

Variations:
Control: Users navigate using the bottom navigation bar (with fixed icons for Home, Meals, Settings, etc.).
Variation: Users scroll between screens with horizontal swiping (or vertical scrolling) to switch between sections, without a bottom navigation bar.

Expected Outcome:
If scrolling between screens leads to better engagement and higher satisfaction compared to the fixed bottom navigation bar, we will consider switching to this style for improved user experience.

3.A/B Test Name: Notifications Impact on User Retention & DAU
**Metrics:**
Daily Active Users (DAU) / User retention rate

**Hypothesis:**
We believe that sending notifications will boost user retention and increase the number of daily active users compared to not sending any notifications.

**Experiment Setup:**
Audience: Randomly assign 50% of users to receive notifications (Variation) and 50% to receive no notifications (Control).
**Tracking:** 

DAU: Measures the number of users active each day 
Retention Rate: Tracks how many users return over a set period

**Expected Outcome:**
If users receiving notifications show higher retention and DAU than those not receiving notifications, it will indicate that notifications positively influence user engagement.
