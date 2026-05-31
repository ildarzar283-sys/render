FROM nokitakaze/amnezia-vpn-server:latest

# Устанавливаем SSH-сервер
RUN apt-get update && apt-get install -y openssh-server

# Настраиваем SSH для root (для Amnezia)
RUN echo "root:D524Docker!" | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD service ssh start && tail -f /dev/null
