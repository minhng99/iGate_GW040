portName_L=["wl0","usb0","96368VVW|eth0","96368VVW|eth1","96368VVW|eth2","96368VVW|eth3","96362ADVNG|eth0","96362ADVNG|eth1","96362ADVNG|eth2","96362ADVNG|eth3","96362ADVNG|eth4"];var portName_U=["wl0","USB","96368VVW|ENET1","96368VVW|ENET2","96368VVW|ENET3","96368VVW|ENET4","96362ADVNG|ENET1","96362ADVNG|ENET2","96362ADVNG|ENET3","96362ADVNG|ENET4","96362ADVNG|ENET5"];function getUNameByLName(c){var b=0;var d="";var a="";if(c.indexOf("|")==-1){return c}if(c.indexOf("wl0.")!=-1){a=c.substring(c.indexOf("wl0.")+4);return("wl0_Guest"+a)}else{if(c.indexOf("wl0")!=-1){return"wlan0"}else{if(c.indexOf("wl1.")!=-1){a=c.substring(c.indexOf("wl1.")+4);return("wl1_Guest"+a)}else{if(c.indexOf("wl1")!=-1){return"wlan1"}}}}if(c.indexOf("usb0")!=-1){return"USB"}for(b=0;b<portName_L.length;b++){if(portName_L[b]==c){d=portName_U[b].split("|");return d[1]}}d=c.split("|");return d[1]}function getLNameByUName(b){var a=0;var d=b.split("|");var f="";var e="";var c="";if(b.indexOf("|")==-1){return b}if(b.indexOf("wl0_Guest")!=-1){c=b.substring(9);return("wl0."+c)}if(b.indexOf("wlan0")!=-1){return"wl0"}if(b.indexOf("wl1_Guest")!=-1){c=b.substring(9);return("wl1."+c)}if(b.indexOf("wlan1")!=-1){return"wl1"}if(b.indexOf("USB")!=-1){return"usb0"}for(a=0;a<portName_U.length;a++){e=portName_U[a].split("|");if(portName_U[a]==b){f=portName_L[a].split("|");return f[1]}}f=b.split("|");return f[1]};