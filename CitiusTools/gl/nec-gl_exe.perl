#!/usr/bin/perl

#ProLNat NER 
#autor: Grupo ProLNat@GE, CITIUS
#Universidade de Santiago de Compostela



use strict; 
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
use utf8;

# Absolute path 
use Cwd 'abs_path';
use File::Basename;
my $abs_path = dirname(abs_path($0));

do $abs_path.'/Modules/nec-gl.perl';




#####EXECUTANDO AS FUNÇOES:
my @tagged = <STDIN>;
my $saida = nec_gl(@tagged);
#my $saida = join("\n",@nec);
print "$saida";
###########

