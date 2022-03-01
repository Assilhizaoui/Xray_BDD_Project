node() {

    def repoURL = 'https://github.com/Assilhizaoui/Xray_BDD_Project.git'

    
    stage('Checkout Self') {
        git branch: 'main', credentialsId: '', url: repoURL
    }
    stage('Cucumber Tests') {
        withMaven(maven: 'maven3.8.4') {			
		bat	'mvn clean test'
		
        }
    }
    stage('Expose report') {
        archive "**/cucumber.json"
        cucumber '**/cucumber.json'
    }
	stage('Import results to Xray') {

		def description = "[BUILD_URL|'http://localhost:8080/browse/EX-1']"
		def labels = '["regression","automated_regression"]'
		def environment = "DEV"
		def testExecutionFieldId = 10005
		def testEnvironmentFieldName = "customfield_10136"
		def projectKey = "ExpertTeamBDDProject"
		def xrayConnectorId = '30b960a7-8d25-4744-b9d2-ac3e7bb531b4'
		def info = '''{
				"fields": {
					"project": {
					"key": "''' + projectKey + '''"
				},
				"labels":''' + labels + ''',
				"description":"''' + description + '''",
				"summary": "Automated Regression Execution @ ''' + env.BUILD_TIME + ' ' + environment + ''' " ,
				"issuetype": {
				"id": "''' + testExecutionFieldId + '''"
				},
				"''' + testEnvironmentFieldName + '''" : [
				"''' + environment + '''"
				]
				}
				}'''

			echo info

			step([$class: 'XrayImportBuilder', endpointName: '/cucumber/multipart', importFilePath: 'target/cucumber.json', importInfo: info, inputInfoSwitcher: 'fileContent', serverInstance: xrayConnectorId])
		}
}
