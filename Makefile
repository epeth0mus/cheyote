BUNDLE := org.coolstar.cheyote

.PHONY: all clean

all: clean
	#$(MAKE) -C amfidebilitate clean all
	#cd Cheyote/resources && tar -xf basebinaries.tar
	#rm -f Cheyote/resources/{amfidebilitate,basebinaries.tar}
	#cp {amfidebilitate}/bin/* Cheyote/resources
	#cd Cheyote/resources && tar -cf basebinaries.tar amfidebilitate jailbreakd jbexec pspawn_payload-stg2.dylib pspawn_payload.dylib
	#rm -f Cheyote/resources/{amfidebilitate,jailbreakd,jbexec,*.dylib}
	xcodebuild clean build CODE_SIGNING_ALLOWED=NO ONLY_ACTIVE_ARCH=NO PRODUCT_BUNDLE_IDENTIFIER="$(BUNDLE)" -sdk iphoneos -scheme Cheyote -configuration Release -derivedDataPath build
	ln -sf build/Build/Products/Release-iphoneos Payload
	rm -rf Payload/Cheyote.app/Frameworks
	zip -r9 Cheyote.ipa Payload/Cheyote.app

clean:
	rm -rf build Payload Cheyote.ipa
	#$(MAKE) -C amfidebilitate clean
