
import geni.portal as portal
import geni.rspec.pg as rspec

# Create a Request object to start building the RSpec.
request = portal.context.makeRequestRSpec()
# Create a XenVM
node = request.XenVM("node")
node.disk_image = "urn:publicid:IDN+emulab.net+image+emulab-ops:UBUNTU18-64-STD"
node.routable_control_ip = "true"


#node.addService(rspec.Execute(shell="/bin/sh",
#                             command="wget https://repo.anaconda.com/archive/Anaconda3-5.2.0-Linux-x86_64.sh"))
#node.addService(rspec.Execute(shell="/bin/sh",
#                              command="bash Anaconda3-5.2.0-Linux-x86_64.sh -b -p /opt/anaconda3"))
#node.addService(rspec.Execute(shell="/bin/sh",
#                              command="sudo bash -c echo 'ANACONDA_HOME=/opt/anaconda3/' >> /etc/profile"))
#node.addService(rspec.Execute(shell="/bin/sh",
#                              command="sudo systemctl status apache2"))
node.addService(rspec.Execute(shell="/bin/sh",
                              command='git clone ttps://github.com/longld/peda.git ~/peda'))
node.addService(rspec.Execute(shell="/bin/sh",
                              command='echo "source ~/peda/peda.py" >> ~/.gdbinit'))
# Print the RSpec to the enclosing page.
portal.context.printRequestRSpec()
