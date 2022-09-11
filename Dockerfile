FROM debian
LABEL maintainer="Bastien Vidé"

# Labels
LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.name="Mavyre/eaton-ipm"
LABEL org.label-schema.description="Eaton IPM container"
LABEL org.label-schema.version=1.70.255
LABEL org.label-schema.docker.cmd="docker run -v ~/ipp/db:/usr/local/Eaton/IntelligentPowerProtector/db -v ~/ipp/configs:/usr/local/Eaton/IntelligentPowerProtector/configs -v /bin/systemctl:/bin/systemctl -v /run/systemd:/run/systemd -v /var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket -v /sys/fs/cgroup:/sys/fs/cgroup --net host --privileged eaton-ipp"

WORKDIR /root
RUN apt-get update; \
    apt-get install -y p7zip-full wget libguestfs-tools; \
    wget https://powerquality.eaton.com/Support/Software-Drivers/Downloads/IPS/IPM-1.70.255.VA64_OVF10.ova; \
    7z e IPM-1.70.255.VA64_OVF10.ova IPM-1.70.255.VA64_OVF10-disk1.vmdk; \
    7z e IPM-1.70.255.VA64_OVF10-disk1.vmdk p.lxroot.img; \
    guestfish --ro -a p.lxroot.img -m /dev/sda:/ copy-out /usr/local/Eaton/IntelligentPowerManager/Eaton-IPM .;

FROM debian
WORKDIR /root
COPY --from=0 /root/Eaton-IPM ./
RUN apt-get update; \
    apt-get upgrade -y; \
    apt-get install -y curl openssh-client sshpass; \
    chmod u+x ./Eaton-IPM; \
    ./Eaton-IPM -silent; \
    rm ./Eaton-IPM;

WORKDIR /usr/local/Eaton/IntelligentPowerManager
EXPOSE 4679 4680
VOLUME ["/usr/local/Eaton/IntelligentPowerManager/db"]
VOLUME ["/usr/local/Eaton/IntelligentPowerManager/configs"]

CMD ["./mc2", "-start"]
HEALTHCHECK --interval=1m --timeout=10s \
  CMD curl -f http://localhost:4679 || exit 1