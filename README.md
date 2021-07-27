# Plastic-Composte-Timelapse
This will be a simple list of instructions for the next set of researchers. The files of each camera should be saved in a seperate branch of this project. 
For these instructions you must download one of the sets of photos and navigate to that file directory in cmd line. https://git-scm.com/downloads
You can use the above link to have a linux style cmd line on your windows system. 


The script files will be names things similar to cameraScript.sh. When trying to run the scripts designed to run autonomously they will need to be added to
the cron table of the device. You can do that with this command:

1.first run this code to open the cron table
<pre><code>sudo crontab -e
</code></pre>

2.it will ask you what editor you want to use any of the selections should be okay

3.At the bottom of the file that opens put the script or command you want to be executed

The format for cron table commands is this:

<pre><code>* * * * * [filepath to script]
</code></pre>

the stars represent minute, hour, day, month, day of week in that order. The stars need to have spaces inbetween. 

<pre><code>*/5 * * * * /home/pi/cameraScript.sh  
</code></pre>  is the example used in the proof of concept experiment. The /5 under the first star means every 5 minutes.

To change to a different script change the filepath to be where the script is.

Timelapse code to be run in a file with all the pictures taken in it
<pre><code>\ffmpeg -r 15 -f image2 -pattern_type glob -i '2021*.jpg' -s 1920x1080 -vcodec libx264 timelapse.mp4
</code></pre>
