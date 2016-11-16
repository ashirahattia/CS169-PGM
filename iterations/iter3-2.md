User Stories Created
As a TA, In order to fetch group or project data, I want to push a button and get all of it from a google sheet
As a TA, In order to optimize matches, I want a matching algorithm that pairs groups to projects that maximizes the amount of groups that get one of their top project preferences
As a TA, In order to confirm that the algorithm produced a high-utility match, I want some visual cues like color and average preference  to be visible on the match page
As a TA, In order to ensure that unauthorized individuals cannot access or edit the matches, I want the application to be protected by authentication

Plan for this iteration-----

Iter 3 Features/Updates
Implemented this iteration:
-Hungarian Algorithm for project group matching
-Google Sheet parsing to add groups/projects
-TA authentication
-UI add visual cues like color

To Do Items
-Consider more edge cases for algorithm:
  -Matching projects that have high priority
  -Matching groups that bring in their own projects
  -Fixing bug that occurs when project is deleted on app
-individual peer evaluation surveys on bcourses
-schedule next meeting with Darren

Tentative 4 Iteration Plan-----

Iter 1 Features/Updates
-Add dummy matching algorithm
-Set up database with dummy data
-Build button to call the algorithm

Iter 2 Features/Updates
-Add/edit group preferences
-Add new Projects
-update UI

Iter 3 Features/Updates
-Implement matching algorithm
-Import groups/preferences/projects from google sheet api
-update UI (visual cues: color, etc)

Iter 4 Features/Updates
-Optimize algorithm (costs, high priority projects, etc.)
-update UI