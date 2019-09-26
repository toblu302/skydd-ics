#!/bin/sh
echo "[ check perl code ]"
for i in `find .. -type f \( -name "*.pl" -o -name "*.pm" \)`; do
    head -1 $i | grep ' \-T' >/dev/null;
    if [ $? == 0 ]; then
        perl -T -c $i
        if [ $? != 0 ]; then
            echo "SYNTAX ERROR: ${i}"
	    exit 1
        fi
    else 
        perl -c $i
        if [ $? != 0 ]; then
            echo "SYNTAX ERROR: ${i}"
	    exit 1
        fi
    fi
done

echo "[ check python code ]"
find .. -name "*.py" -exec python -m py_compile "{}" \;

echo "[ check javascript code ]"
for i in `find .. -name "*.js"`; do
   node -c ${i}
   if [ $? != 0 ]; then
       echo "SYNTAX ERROR: ${i}"
       exit 1
   fi
done

echo "[ check yaml syntax ]"
for i in `find .. -name "*.yml"`; do
   perl -MYAML -e "use YAML;YAML::LoadFile('${i}')"
   if [ $? != 0 ]; then
       echo "SYNTAX ERROR: ${i}"
       exit 1
   fi
done

echo "[ check javascript code ]"
for i in `find .. -name "*.js"`; do
   node -c ${i}
   if [ $? != 0 ]; then
       echo "SYNTAX ERROR: ${i}"
       exit 1
   fi
done

echo "[ check bash syntax ]"
for i in `find .. -name "*.sh"`; do
   bash -n ${i}
   if [ $? != 0 ]; then
       echo "SYNTAX ERROR: ${i}"
       exit 1
   fi
done

echo "[ check ansible syntax ]"
ansible-lint ../files/ansible/inventory.yml
if [ $? != 0 ]; then
   echo "SYNTAX ERROR: ${i}"
   exit 1
fi
for i in $(ls ls ../files/ansible/playbooks); do
    ansible-lint ls ../files/ansible/playbooks/${i}
   if [ $? != 0 ]; then
       echo "SYNTAX ERROR: ${i}"
       exit 1
   fi
done

echo "[ done ]"
