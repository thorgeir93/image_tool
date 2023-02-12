#!/bin/bash
#
# Specific script to generate footer on myndabok2022.
# Gets the date from a given image and names, and
# outputs the date in icelandic format and full names.
# 
# Example Usage:
#  $ bash generate_date_names.sh /home/thorgeir/media/photos/export/myndabok2022/print/IMG_2027.jpg stigur birna

image=${1}; shift
names=${@}; shift

echo -n "$(bash get_image_date.sh $image) -"

for name in $names; do
    sep=","
    echo -n " "
    case $name in
      stigur)
        echo -n "Stígur Eyfjörð Ævarsson${sep}"
        ;;
      arndis)
        echo -n "Arndís Eva Finnsdóttir${sep}"
        ;;
      birna)
        echo -n "Birna Eyfjörð Ævarsdóttir${sep}"
        ;;
      elma)
        echo -n "Elma Jóhannsdóttir${sep}"
        ;;
      katrin)
        echo -n "Katrín Birna Viðarsdóttir${sep}"
        ;;
      sigurdur)
        echo -n "Sigurður Grétar Ottósson${sep}"
        ;;
      vidar)
        echo -n "Viðar Bjarnason${sep}"
        ;;
      thorgeir)
        echo -n "Þorgeir Eyfjörð Sigurðsson${sep}"
        ;;
      aevar)
        echo -n "Ævar Eyfjörð Sigurðsson${sep}"
        ;;
      frimann)
        echo -n "Frímann Viðar Sigurðsson${sep}"
        ;;
      bjarni)
        echo -n "Bjarni Sigurðsson${sep}"
        ;;
      baltasar)
        echo -n "Baltasar Eyfjörð Ævarsson${sep}"
        ;;
      eydis)
        echo -n "Eydís Helgadóttir${sep}"
        ;;
      oddny)
        echo -n "Oddný Benónýsdóttir${sep}"
        ;;
      freyja)
        echo -n "Freyja Benónýsdóttir${sep}"
        ;;
      thorgerdur)
        echo -n "Þorgerður Jóna Guðmundsdóttir${sep}"
        ;;
      *)
        month=Unknown
        ;;
    esac
 

#  "Birna Eyfjörð Ævarsdóttir"
#  "Stígur Eyfjörð Ævarsson"
#  "Baltasar Eyfjörð Ævarsson"
#  "Ævar Eyfjörð Sigurðsson"
#  "Þorgeir Eyfjörð Sigurðsson"
#  "Frímann Viðar Sigurðsson"
#  "Bjarni Sigurðsson"
#  "Sigurður Grétar Ottósson"
#  "Katrín Birna Viðarsdóttir"
#  "Elma Jóhannsdóttir"
done
