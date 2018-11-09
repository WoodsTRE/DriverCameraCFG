cam0=$(sudo find /dev/video0 | wc -l)
cam1=$(sudo find /dev/video1 | wc -l)
if test $cam0 -eq 1
then
    echo "Video0 exist"  
    if test $cam1 -eq 1
    then
     echo "Camera drivers conflict, swiching Video0 to Video1" 
     sudo rm /dev/video0
     sudo mv /dev/video1 /dev/video0
    fi
else
    echo "No camera drivers detected,applyng fix "
    sudo modprobe -r uvcvideo
    sudo modprobe uvcvideo 
    sudo rm /dev/video0
    sudo mv /dev/video1 /dev/video0
fi
echo "Done"
