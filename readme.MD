This repo is related to https://github.com/FariusGitHub/dockerize_web_app
Please refer to https://medium.com/p/984a570389d0/edit for the whole story.

Once this repo was cloned locally into your machine, please run
docker compose up

You will be able to see the web app through your browser via
https://localhost:5000

If you would like to use EC2, you could use attached ansible code and run
ansible-playbook ansible.yml --private-key=~/Downloads/wcd-projects.pem

The code is good enough until launching template and Auto Scale Group (ASG).
You may still need to go to AWS Portal to run AWS ECS manually.

Once you finish testing, terminate the ECS, ASG and EC2 instances manually.
The rest of AWS resources could be removed automatically from ansible code.


