#!/bin/bash

printf "
RUN export uid=$(id -u $USER) gid=$(id -u $USER) && \\
" >> $1/firefox/Dockerfile.test
printf '     mkdir -p /home/developer && \\
     echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \\ 
     echo "developer:x:${uid}:" >> /etc/group && \\ 
     echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \\
     chmod 0440 /etc/sudoers.d/developer && \\
     chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
CMD /usr/bin/firefox' >> $1/firefox/Dockerfile.test
