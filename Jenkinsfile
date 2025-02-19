pipeline {
    agent any
    
    triggers {
        cron('H/2 * * * *')
    }
    parameters {
        string(name: 'PR_BRANCH', defaultValue: '', description: 'Branch của Pull Request')
    }
    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('firebase-service-account') // Thay bằng ID credentials trên Jenkins
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: "${params.PR_BRANCH}", url: 'https://github.com/ThanhduyAT/Media-App.git'
            }
        }

        stage('Build & Upload via Fastlane') {
            steps {
                script {
                    def branchName = params.PR_BRANCH ?: sh(script: "git rev-parse --abbrev-ref HEAD", returnStdout: true).trim()
                    if (branchName == 'main') {
                        echo "Skipping build for main branch. Only building PRs."
                        currentBuild.result = 'ABORTED'
                        return
                    }
                }
                sh 'fastlane upload_to_fb'
            }
        }
    }
}
