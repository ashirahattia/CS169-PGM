User Stories Created-----
As a TA, In order to ensure that loyal customers' projects get matched, I want to match them separately from the main preference-based matching algorithm
As a TA, In order to have more control over the type of optimal I want the algorithm to output, I want to be able to manually add in costs for each group preference in form fields
As a TA, In order to better understand how successful the matching algorithm was, I want to see a "health" utility value at the top of the matching
As a TA, In order to prevent accidentally rematching, I want to see a warning when I hit the "re-match" button
As a TA, In order to assure that loyal customers get their projects matched, I want to be able to flag certain projects are requiring a match
As a TA, In order to ensure that groups can bring their own clients, I want to be able to declare that a customer was brought by a group, assign that customer to that group, and remove that customer and group from the matching algorithm
As a TA, In order to ensure that groups can bring their own clients, I want to be able to declare that a customer was brought by a group, assign that customer to that group, and remove that customer and group from the matching algorithm
As a TA, In order to see which projects weren't matched, I want to be able to see unmatched projects at the bottom of the matching algorithm
As a TA, In order to understand what various portions of the app do, I want to be able to read instructions on each of the action items

Plan for this iteration-----
This is a large iteration for us, after discussions with Darren, we will deprioritize specific aspects
of the algorithm, such as including high priority projects. We will also continue discussions throughout
the iteration to adjust prioritization depending on our progress.


To Do Items-----
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