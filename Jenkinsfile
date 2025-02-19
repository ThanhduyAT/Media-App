pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/ThanhduyAT/Media-App.git'
            }
        }

        stage('Build') {
            steps {
                sh 'fastlane upload_to_fb'
            }
        }
    }
}
