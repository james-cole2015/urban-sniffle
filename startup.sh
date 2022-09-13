#########################
#### Start Up Script ####
#########################
#!/bin/bash
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no'/g /etc/ssh/sshd_config
sed -i 's/ChallengeResponseAuthentication yes/ChallengeResponseAuthentication no'/g /etc/ssh/sshd_config
sed -i 's/UsePAM yes/UsePAM no'/g /etc/ssh/sshd_config