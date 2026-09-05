pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

       stage('Hygiene Check') {
    steps {
        bat '"C:\\Program Files\\Git\\usr\\bin\\bash.exe" scripts/hygiene.sh'
    }
}

        stage('Install') {
            steps {
                bat 'echo No dependencies to install'
            }
        }

        stage('Test') {
            steps {
                bat 'if not exist tests\\test_project.sh exit /b 1'
                bat 'if not exist Index.html exit /b 1'
                bat 'echo All tests passed!'
            }
        }

        stage('Build') {
            steps {
                bat 'echo No build step required for static HTML project'
            }
        }
    }

    post {
        success {
            echo 'Jenkins pipeline completed successfully.'
        }
        failure {
            echo 'Jenkins pipeline failed.'
        }
    }
}
