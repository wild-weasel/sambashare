#!/bin/bash
sed -e "s/{SMB_NAME}/${SMB_NAME}/" -e "s/{SMB_USER}/${SMB_USER}/" /etc/samba/smb.tmpl > /etc/samba/smb.conf
groupadd -g ${PGID} ${SMB_USER}
adduser --disabled-password --no-create-home --gecos "" --uid ${PUID} --gid ${PGID} ${SMB_USER}
chown -R ${SMB_USER}:${SMB_USER} /share
(echo ${SMB_PASSWORD}; echo ${SMB_PASSWORD}) | smbpasswd -a ${SMB_USER}
service smbd restart
sleep infinity
