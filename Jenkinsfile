pipeline{
    agent any
    options{
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '5'))

    }
    environment{
        docker_registry = "Nehak275/final_capstone"
        dockerhub_credentials = 'dockerhub_credentials'
        dockerImage = ''       
    }
    tools{
        nodejs 'node'
        jdk 'jdk11'
    }
    stages{
        stage("Installing Node Modules, Building image, Pushing Image, Deploy"){
            when{
                branch 'main'
            }
            stages{
                stage("Building Docker Image"){
                    steps{
                        script{
                            dockerImage = docker.build docker_registry + ":$GIT_COMMIT-build-id-$BUILD_NUMBER"
                        }
                    }
                }
                stage("Pushing the docker image"){
                    steps{
                        script{
                            docker.withRegistry('', dockerhub_credentials){
                                dockerImage.push()
                                dockerImage.push('latest')
                                
                            }
                        }
                    }
                }
            }
        }    
    }

}
