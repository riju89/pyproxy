echo "Debian And Ubuntu Auto Installer Running.."
IP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
apt-get update
apt-get install python
apt-get install nohup
apt-get install python-pip
pip install --upgrade configs/proxy.py
python configs/setup.py
clear
clear
echo "Close Putty Your Proxy is=  $IP : 8080"
nohup python configs/proxy.py --hostname $IP --port 8080 >> proxlog.txt &