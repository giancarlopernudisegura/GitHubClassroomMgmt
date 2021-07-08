# Scripts to manage GitHub Classroom

This folder contains scripts to collect assignments and push feedback to student repositories in a given GitHub organization. There are no repo creation scripts here, since we use GitHub classroom for this part. Loop at [https://github.com/snadi/UsefulCourseScripts](https://github.com/snadi/UsefulCourseScripts) if you are interested in that.

# Prerequisites

The following python liraries are being used:

- [github3](https://github.com/sigmavirus24/github3.py)
- getpass
- subprocess
- csv
- argparse
- os

## GitHub Token
You'll also need a GitHub token file. To get a token, go to **Settings > Developer settings > Personal access tokens** and click on [Generate new token](https://github.com/settings/tokens/new). For grading student assignments and submissions, give it enough permissions to read and write to repositories. When you click your **Generate** it will take you back to the overview of your tokens. Copy that token, create a new file and paste the token into there.
![screenshot example](https://i.gyazo.com/51d1e700f5b54339e0921d67188b1369.png)

# Script descriptions:

Create a directory called `assignmentName` where all the repos for this assignment will be cloned to. You can run any of the following scripts from within that directory.

- `collect_assignment_at_deadline.py`: For a given assignment, it finds the closest commit that happens before a given deadline (inclusive) and clones/checks out the repository at that commit. Run `python collect_assignments_at_deadline.py --help` to see required arguments.

- `collect_assignments_now.py`: same as above but gets the current state of the repo (can be useful if you will pull all repos at the deadline yourself)

- `push_feedback_to_all.sh`: goes through all the directories in the current folder and pushes the feedback file in each student's repo. The name of the feedback file is passed as the first argument. IMPORTANT: because the collection process leaves the repo in a detached state, make sure that your marking script does `git checkout master` before running this script. Otherwise, this script will not be able to push correctly while repo is in a detached state. You could obviously als push the feedback script directly in your marking phase. However, it is probably a good idea for the instructor to approve all grades and feedback before showing it to the students.

- `update_all_repos.sh`: simply loops through all the directories in the current folder and runs git pull.
