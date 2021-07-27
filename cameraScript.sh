#!/bin/bash

#Date and Time variable
DATE=$(date +"%Y-%m-%d_%H%M")
FOLDER=$(date +"%Y-%m-%d")

#Camera Operation command
#raspistill -o /home/pi/camera/$DATE.jpg -w 1920 -h 1080

#Make the camera folder at the correct location so user does not need to
cd /home/pi
mkdir -p camera

#Must enter directory with git repository
cd /home/pi/camera
#Make folder for that days pictures
mkdir -p $FOLDER

#Camera Operation to fit automation
raspistill -o /home/pi/camera/$FOLDER/$DATE.jpg -w 1920 -h 1080

#git operations
sudo git add --all  ./$FOLDER/*.jpg
sudo git commit -m "Pic taken at $DATE"
#Origin is the github repository The second is the branch for the experiment running on the Pi change the second to change the branch use
git push origin Proof_Of_Concept 
