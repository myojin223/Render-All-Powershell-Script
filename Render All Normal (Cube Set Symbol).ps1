function ProxyRename {
    Param(
        [Parameter(Mandatory, Position = 0)][string]$Template
    )
    
    $srcpath = ".\images\fronts\" # Path to Proximtiy Output Images with trailing \
    $dstpath = ".\Completed\" # Path to folder for completed, renamged images with trailing \

    $srclist = Get-ChildItem -Path $srcpath

    foreach ($srcimage in $srclist) {
        if ($Template -eq "NONE") {
            $dstimage = $srcimage.name -replace "^\d+ (.*).png","`$1.png"
        }
        else {
            $dstimage = $srcimage.name -replace "^\d+ (.*).png","`$1 ($Template).png"
        }
        $srcimage = $srcpath + $srcimage.name
        $dstimage = $dstpath + $dstimage
        Move-Item "$srcimage" "$dstimage" -Force
    }

}

java -jar proximity.jar --cards=Decklist.txt --art_source=LOCAL --reminder_text=true --template=M15 --copyright=false --use_card_back=false --set_symbol=pz1
ProxyRename "NONE"

java -jar proximity.jar --cards=Decklist.txt --art_source=LOCAL --reminder_text=true --template=FANGEXT --copyright=false --use_card_back=false --set_symbol=pz1
ProxyRename "FANG Extended"

java -jar proximity.jar --cards=Decklist.txt --art_source=LOCAL --reminder_text=true --template=FANG --copyright=false --use_card_back=false --set_symbol=pz1
ProxyRename "FANG"

java -jar proximity.jar --cards=Decklist.txt --art_source=LOCAL --reminder_text=true --template=M10 --copyright=false --use_card_back=false --set_symbol=pz1
ProxyRename "M10"

java -jar proximity.jar --cards=Decklist.txt --art_source=LOCAL --reminder_text=true --template=SSDFC --copyright=false --use_card_back=false --set_symbol=pz1
ProxyRename "SSDFC"

java -jar proximity.jar --cards=Decklist.txt --art_source=LOCAL --reminder_text=true --template=MaleMPC --copyright=false --use_card_back=false --set_symbol=pz1
ProxyRename "MaleMPC"

java -jar proximity.jar --cards=Decklist.txt --art_source=LOCAL --reminder_text=true --template=Extended --copyright=false --use_card_back=false --set_symbol=pz1
ProxyRename "Extended"

java -jar proximity.jar --cards=Decklist.txt --art_source=LOCAL --reminder_text=true --template=PHYREXIAN --copyright=false --use_card_back=false --set_symbol=pz1
ProxyRename "Phyrexian"