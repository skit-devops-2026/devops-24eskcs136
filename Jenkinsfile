pipeline {
    agent any

    stages {
        stage('Install') {
            steps {
                bat 'echo No dependencies to install'
            }
        }

        stage('Test') {
            steps {
                bat 'if not exist tests\\test_project.sh exit /b 1'
                bat 'if not exist Index.html exit /b 1'
                bat 'if not exist Home.html exit /b 1'
                bat 'if not exist Contact.html exit /b 1'
                bat 'echo All tests passed!'
            }
        }

        stage('Build') {
            steps {
                bat 'echo No build step required for static HTML project'
            }
        }
    }
}
