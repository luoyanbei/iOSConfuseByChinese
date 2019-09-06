#!/usr/bin/env bash

TABLENAME=symbols
SYMBOL_DB_FILE="symbols"
STRING_SYMBOL_FILE="func.list"
HEAD_FILE="$PROJECT_DIR/$PROJECT_NAME/codeObfuscation.h"
export LC_CTYPE=C

#维护数据库方便日后作排重
createTable()
{
echo "create table $TABLENAME(src text, des text);" | sqlite3 $SYMBOL_DB_FILE
}

insertValue()
{
echo "insert into $TABLENAME values('$1' ,'$2');" | sqlite3 $SYMBOL_DB_FILE
}

query()
{
echo "select * from $TABLENAME where src='$1';" | sqlite3 $SYMBOL_DB_FILE
}

ramdomString()
{

char_table=("擝擞擟擡擢擤" "擥擧擨擩擪擫" "擭擮摈擳擵" "擶撷擸擹" "擽擿攁攂" "攃摅" "攅撵攇攈攉攊攋攌攍" "攎拢攐攑攒" "攓" "攕" "撄" "攗" "攘" "搀" "攚" "撺" "攞" "攟" "攠" "攡" "攒" "挛" "攥" "攦" "攧" "攨" "攩" "搅" "攫" "攭" "攮")
idx="I"
for ((i=0; i<100; i++ )) do
if [ $i -eq 0 ]; then
idx=rand
echo -n ${char_table[$idx]}
else
idx=$(($RANDOM % 10))
echo -n ${char_table[$idx]}
fi
done


}

rand(){
idx=$(($RANDOM % 10))
}

rm -f $SYMBOL_DB_FILE
rm -f $HEAD_FILE
createTable

touch $HEAD_FILE
echo '#ifndef Demo_codeObfuscation_h
#define Demo_codeObfuscation_h' >> $HEAD_FILE
echo "//confuse string at `date`" >> $HEAD_FILE
cat "$STRING_SYMBOL_FILE" | while read -ra line; do
if [[ ! -z "$line" ]]; then
ramdom=`ramdomString`
headstr="aaa"
echo $line $ramdom
insertValue $line $ramdom
echo "#define $line $ramdom" >> $HEAD_FILE
fi
done
echo "#endif" >> $HEAD_FILE


sqlite3 $SYMBOL_DB_FILE .dump

