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
                bat 'set "PATH=C:\\Program Files\\Git\\usr\\bin;C:\\Program Files\\Git\\mingw64\\bin;%PATH%" && "C:\\Program Files\\Git\\usr\\bin\\bash.exe" scripts/hygiene.sh'
            }
        }

        stage('Install') {
            steps {
                bat 'echo No dependencies to install'
            }
        }

        stage('Test') {
            steps {
                bat 'if not exist Index.html exit /b 1'
                bat 'if not exist Home.html exit /b 1'
                bat 'if not exist Contact.html exit /b 1'
                bat 'if not exist About_Us.html exit /b 1'
                bat 'if not exist Help_Centre.html exit /b 1'
                bat 'if not exist Search.html exit /b 1'
                bat 'if not exist Privacy_Policy.html exit /b 1'

                bat 'if not exist Style\\Index.css exit /b 1'
                bat 'if not exist Style\\Home.css exit /b 1'
                bat 'if not exist Style\\Contact.css exit /b 1'

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
