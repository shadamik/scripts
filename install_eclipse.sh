#!/bin/bash

tmpwks=$(mktemp -d)

eclipse \
   -nosplash -data $tmpwks -consolelog -clean \
   -application org.eclipse.equinox.p2.director \
   -repository \
http://ftp-stud.hs-esslingen.de/pub/Mirrors/eclipse/releases/luna/,\
http://ftp-stud.hs-esslingen.de/pub/Mirrors/eclipse/egit/updates/,\
http://ftp-stud.hs-esslingen.de/pub/Mirrors/eclipse/eclipse/updates/4.4/\
   -installIU org.eclipse.platform.ide,\
org.eclipse.help.feature.group,\
org.eclipse.rcp.feature.group,\
org.eclipse.cdt.feature.group,\
org.eclipse.cdt.debug.ui.memory.feature.group,\
org.eclipse.cdt.debug.standalone.feature.group,\
org.eclipse.cdt.launch.remote.feature.group,\
org.eclipse.cdt.autotools.feature.group,\
org.eclipse.rse.feature.group,\
org.eclipse.egit.feature.group\
   -tag InitialState \
   -destination $1 \
   -profile CustomProfile \
   -profileProperties org.eclipse.update.install.features=true\
   -bundlepool $1 \
   -p2.os linux \
   -p2.ws gtk \
   -p2.arch x86_64 \
   -roaming

rm -fr $tmpwks
