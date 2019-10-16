# CFEngine Client Installation

 1. Install CFEngine Client (cfengine-nova).
 2. Bootstrap client to CFEngine Hub.
 3. Run the Agent 
 
```
yum install -y cfengine-nova

/usr/local/sbin/cf-agent -B cfengine-hub01.example.com

/usr/local/sbin/cf-agent -IC -K 
```
## CFEngine Useful Commands
```
awk 1 /var/cfengine/policy_server.dat       # Tells me what CFEngine Hub the server is assoicate with.

rpm -qa | grep -i cfengine-nova             # Confirms version of CFEngine client software running on the server.

cf-agent -v | grep -qi '100% kept' && echo "Compliant" || echo "Non-Compliant"          # Verifies if server is Compliant.
```




