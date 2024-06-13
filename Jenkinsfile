pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS=credentials("dockerhub_creds")
    }
    stages {
        stage ("code"){
            steps {
                git branch: "bmr", url: "https://github.com/madhavareddy97056/job_board.git"
            }
        }
        stage ("build docker image"){
            steps {
                sh "docker build -t madhavareddy97056/job_board:$image_name ."
            }
        }
        stage ("upload docker image to Dockerhub"){
            steps {
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                sh "docker push madhavareddy97056/job_board:$image_name"
            } 
        }
        stage ("deploy docker container"){
            steps {
                sh "docker run -itd --name $container_name -p $host_port:$container_port madhavareddy97056/job_board:$image_name"
            }
        }
        }
    }


