#!/bin/bash

## user-data will get sudo access by default

dnf install ansible -y
cd /tmp
#git clone https://github.com/sid2417/ansible-role-miniproject-bykithu.git
git clone https://github.com/sid2417/ansible-dynamic-inventory-bykithu.git
#cd ansible-role-miniproject-bykithu
cd ansible-dynamic-inventory-bykithu

ansible-playbook main.yaml -e component=backend -e db_password=ExpenseApp1  
ansible-playbook main.yaml -e component=frontend


# Here we overriding the db_password 
# simply removing the @ ( db_password: ExpenseApp@1 )
# bocz while connecting the db we do not use symbols 