#!/bin/bash

read -p "Please input the local nodeos http port, such as 8888 : " PORT
cd
# param
APIURL="127.0.0.1:$PORT"
PDIR="./dimension/build/programs"
ACCNAME="testaccount1"
GNODE="gnodeaccount"
PKEY="EOS53A7xmcSWLuzTZLnJBsj63FB3yxNYXTUGuXNKPjxg5uYkToSXV"

function clean(){
    pid=$(cat $WALLETDIR/keosd.pid)
    echo "kill keosd pid : $pid "
    kill $pid
    rm $WALLETDIR/keosd.pid
    rm $WALLETDIR/$WALLETNAME.wallet
    history -c
    history -w
}

function test(){
    if [ $1 -eq 0 ];then
        echo "test failed, please check"
        clean
        exit 2
    fi
}

function random()
{
    string="abcdefghijklmnopqrstuvwxyz12345"
    str_length=${#string}
    num=$(date +%s%N)
    ((retnum=num%str_length))
    gnodename=$gnodename${string:$retnum:1}
}

cd `pwd`
# step 1 : find the unused port and get the cleos
WALLETPORT=("8900" "9900" "8901" "8902" "9903" "8904" "8905" "9906")
for p in ${WALLETPORT[*]}
    do
        r=`netstat -ano | grep $p | wc -l`
        if [ $r -eq 0 ];then
            WALLETURL="127.0.0.1:$p"
            break
        fi
    done

cleos version client > /dev/null
if [ $? -eq 0 ]
    then
        cleos="cleos -u http://$APIURL --wallet-url http://$WALLETURL " "$@"
    else
        cleos="$PDIR/cleos/cleos -u http://$APIURL --wallet-url http://$WALLETURL " "$@"
fi

# step 2 : start keosd wallet, create new wallet and import testaccount1 account
WALLETDIR="./test-wallet"
WALLETNAME="test"
PRIVATE_KEY="5J87xzDDoJes9uzLE7ZNi71cjhnpRRha7ZeKMtxjpmfveZkKGTE"
mkdir -p $WALLETDIR
if [ -e $WALLETDIR/$WALLETNAME.wallet ]
    then
        rm -r $WALLETDIR/$WALLETNAME.wallet
fi
keosd --http-server-address $WALLETURL -d $WALLETDIR & echo $! > $WALLETDIR/keosd.pid
pid=$(cat $WALLETDIR/keosd.pid)
p=`ps -ef | grep $pid | wc -l`
if [ $p -eq 1 ];then
    $PDIR/keosd/keosd --http-server-address $WALLETURL -d $WALLETDIR & echo $! > $WALLETDIR/keosd.pid        
fi
sleep 0.5
$cleos wallet create -n $WALLETNAME --to-console
$cleos wallet import -n $WALLETNAME --private-key $PRIVATE_KEY


# step 3 : start test
isgnode=`$cleos get table eonio eonio gnode | grep $ACCNAME | wc -l`
if [ $isgnode -ne 0 ];then
    echo "$ACCNAME is gnode, please check."
    clean
    exit 1
fi
set -x
# test 1
$cleos system newproposal $ACCNAME $ACCNAME 0 1 0 
test $?
$cleos system newproposal $ACCNAME $ACCNAME 0 2 0 
test $?
$cleos system newproposal $ACCNAME $ACCNAME 0 3 0 
test $?

# test 2
$cleos system updategnode $ACCNAME $PKEY
test $?
set +x
gnodename=''
for i in {1..12}
    do
        random
    done

#$cleos system newaccount $ACCNAME $GNODE $PKEY --buy-ram-kbytes 8 --stake-net '1 EON' --stake-cpu '3 EON' --transfer
#$cleos transfer $ACCNAME $GNODE '2000 EON'
#$cleos system staketognode $GNODE $PKEY
$cleos system newproposal $GNODE $gnodename 0 2 0 
id=`$cleos get table eonio eonio proposals -l 1000 | grep -B 2 $gnodename | grep id | cut -f 2 -d ":" | cut -f 1 -d ","`
set -x
# test 3
$cleos system execproposal $ACCNAME 7
test $?
$cleos system execproposal $GNODE $id
test $?
set +x
# clean keosd 
clean

# pass the test
echo -e "\n\033[34m" && printf %.s* {1..100} && echo
echo -e "*********************** Congratulations!!! The logic test passed, let's go! ************************"
printf %.s* {1..100} && echo -e "\033[0m\n"
