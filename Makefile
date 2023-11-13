android:
	@echo "Building the project..."
	flutter build ipa
	
ios:
	@echo "Building the project..."
	flutter build ipa

deploy-ios:
	@echo "Deploying the project..."
	xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa --apiKey ${API_KEY} --apiIssuer ${API_ISSUER}

clean:
	@echo "Cleaning up..."
	flutter clean

