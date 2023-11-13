android:
	@echo "Building the Android project..."
	flutter build apk
	
ios:
	@echo "Building the iOS project..."
	flutter build ipa

deploy-ios:
	@echo "Deploying the iOS project..."
	xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey ${API_KEY} --apiIssuer ${API_ISSUER}

clean:
	@echo "Cleaning up..."
	flutter clean

