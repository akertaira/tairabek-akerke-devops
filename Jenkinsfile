pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Akerke'
        STUDENT_SURNAME = 'Tairabek'
        STUDENT_GROUP   = 'IT2-2307'
        STUDENT_ID      = '38137'
        IMAGE_NAME      = 'tairabek-akerke-devops'
        CONTAINER_NAME  = 'tairabek-akerke-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log -1 --oneline'
            }
        }
        stage('Build') {
            steps {
                echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
                echo "Group: ${STUDENT_GROUP}"
                echo "Student ID: ${STUDENT_ID}"
                sh 'chmod +x scripts/Tairabek_Akerke_system.sh'
                sh 'bash -n scripts/Tairabek_Akerke_system.sh'
            }
        }
        stage('Test') {
            steps {
                sh 'test -f Tairabek_Akerke_info.txt'
                sh 'test -f Dockerfile'
                sh 'test -f app/app.py'
                sh './scripts/Tairabek_Akerke_system.sh'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
                sh 'docker images | grep $IMAGE_NAME'
            }
        }
        stage('Docker Run') {
            steps {
                sh 'docker rm -f $CONTAINER_NAME || true'
                sh '''docker run --name $CONTAINER_NAME \
                  -e STUDENT_NAME=$STUDENT_NAME \
                  -e STUDENT_SURNAME=$STUDENT_SURNAME \
                  -e STUDENT_GROUP=$STUDENT_GROUP \
                  -e STUDENT_ID=$STUDENT_ID \
                  $IMAGE_NAME'''
                sh 'docker ps -a | grep $CONTAINER_NAME'
            }
        }
    }

    post {
        success { echo 'Pipeline of Akerke Tairabek finished successfully!' }
        failure { echo 'Pipeline failed. Check the stage logs.' }
    }
}
