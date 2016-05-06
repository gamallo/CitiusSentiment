#!/bin/bash

#shopt -s extglob


###################################################################
# Script para facilitar o uso do sentiment analyzer
#   - A variábel CITIUS_DIR estabelece o PATH dos programas do CitiusTools
#     previamente instalados em ../   
#
# Grupo ProLNat@GE 2014
###################################################################


CITIUS_DIR="./CitiusTools"


############################
# Functions
############################

help()
{
  echo "Syntax: sentiment.sh  <language> <file>
      
      language=es pt en gl
      file=path of the file input 
"
  exit
}


# Parámetros obrigatorios
[ $# -lt 2 ] && help
LING=$1
FILE=$2

case $LING in
  es) ;;
  pt) ;; 
  en) ;;
  gl) ;;
  *) help
esac


SENT=$CITIUS_DIR/$LING"/sentences-"$LING"_exe.perl" 
TOK=$CITIUS_DIR/$LING"/tokens-"$LING"_exe.perl" 
SPLIT=$CITIUS_DIR/$LING"/splitter-"$LING"_exe.perl" 
NER=$CITIUS_DIR/$LING"/ner-"$LING"_exe.perl"
TAGGER=$CITIUS_DIR/$LING"/tagger-"$LING"_exe.perl" 
SENTIMENT="./nbayes.perl"


#NAMEFILE=`basename $FILE`;

ZIP=`echo $FILE |awk '($0 ~ /(gz$|zip$)/) {print "zip"}'`

#echo "OKKKKK";
if [ "$ZIP" == "zip" ] ; then
 zcat $FILE |tr -d '\015' | $SENT  | $TOK | $SPLIT | $NER | $TAGGER | $SENTIMENT $LING/train_$LING $LING/lex_$LING ;

else 
  cat $FILE |tr -d '\015' | $SENT | $TOK | $SPLIT | $NER | $TAGGER | $SENTIMENT $LING/train_$LING $LING/lex_$LING  ;

fi
