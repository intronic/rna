#!/bin/bash

#| bin        | smallint(6)      |      | MUL | 0       |       |
#| chrom      | varchar(255)     |      |     |         |       |
#| chromStart | int(10) unsigned |      |     | 0       |       |
#| chromEnd   | int(10) unsigned |      |     | 0       |       |
#| name       | varchar(255)     |      | MUL |         |       |
#| score      | int(10) unsigned |      |     | 0       |       |
#| strand     | char(1)          |      |     |         |       |
#| thickStart | int(10) unsigned |      |     | 0       |       |
#| thickEnd   | int(10) unsigned |      |     | 0       |       |
#| type       | varchar(255)     |      |     |         |       |

for T in $(hgsql hg18 -Ne 'select distinct type from wgRna')
do 
  echo $T
  #hgsql hg18 -Ne "select chrom,chromStart,chromEnd,name,score,strand,thickStart,thickEnd from wgRna where type=\"$T\" order by chrom,chromStart,chromEnd" > hg18.$T.bed
  mafFrags -thickOnly 
done


#mysql> select count(*),type,name from wgRna group by type,name having count(name)>1;
#+----------+-------+----------------+
#| count(*) | type  | name           |
#+----------+-------+----------------+
#|        3 | miRna | hsa-mir-1184   |
#|        2 | miRna | hsa-mir-1233   |
#|        4 | miRna | hsa-mir-1244   |
#|        4 | miRna | hsa-mir-1302-2 |
#+----------+-------+----------------+

