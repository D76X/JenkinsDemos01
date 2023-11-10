// Example of a Declarative Pipeline
// Pipeline Steps Reference 
// https://www.jenkins.io/doc/pipeline/steps/ 

// Important: 
// make sure that if you create a Jenkinsfile on Windows the encoding is NOT UTF-8 BOM (Byte Order Mark) 
// this file must be UTF-8 for Jenkins to be able to parse it appropriately.
// https://stackoverflow.com/questions/50718320/java-lang-nosuchmethoderror-no-such-dsl-method-pipeline-found-when-running

pipeline {    
    agent any
    stages { 
        stage('SCM') { 
            steps { 
                echo 'Gathering code from version control'     

                // ERROR: Couldn't find any revision to build. Verify the repository and branch configuration for this job.    
                // https://groups.google.com/g/jenkinsci-users/c/GAqYQDjyJp4

                // this works!
                git branch: 'main', url:'https://github.com/D76X/JenkinsDemos01.git'
                
                // fails because it does not replace ${branch} with main? 
                //git branch: '${branch}', url:'https://github.com/D76X/JenkinsDemos01.git'
                
                // fails because it needs to know the revision=branch
                //git url:'https://github.com/D76X/JenkinsDemos01.git'
            }
        }
         stage('Build') { 
            steps { 
                echo 'Building...' 
                
                // this fails in the container!
                // https://www.jenkins.io/doc/pipeline/steps/dotnet-sdk/#withdotnet-with-net
                // From the: Official Jenkins Docker image
                // Installing more tools 
                // https://github.com/jenkinsci/docker/tree/master#installing-more-tools

                // adding .net core to docker container with Jenkins
                // https://stackoverflow.com/questions/48104954/adding-net-core-to-docker-container-with-jenkins

                // How to use sudo inside a docker container?
                // https://stackoverflow.com/questions/25845538/how-to-use-sudo-inside-a-docker-container

                // .NET SDK Support
                // https://plugins.jenkins.io/dotnet-sdk/
                //https://www.jenkins.io/doc/pipeline/steps/dotnet-sdk/#withdotnet-with-net
                //withDotNet(sdk: "sdk6") {
                withDotNet() {
                    sh 'dotnet --version' 
                    sh 'dotnet build ConsoleApp1'       
                }                

                echo 'Building new feature' 
            }
        }        
        stage('Test') { 
            steps { 
                echo 'Testing...'    
            }
        }
        stage('Deploy') { 
            steps {
                echo 'Deploying...'    
            }
        }
    }
}

/*
// Example of a Scripted Pipeline

// https://stackoverflow.com/questions/42113655/no-such-dsl-method-stages
// https://www.jenkins.io/doc/book/pipeline/syntax/
// https://www.jenkins.io/doc/book/pipeline/getting-started/
// https://www.edureka.co/community/74695/nosuchmethoderror-such-method-pipeline-found-among-steps
// https://stackoverflow.com/questions/8072700/how-to-restart-jenkins-manually

example of scripted pipeline in Groovy

node {    
    stage('SCM') {
       echo 'Gathering code from version control'     
    }
    stage('Build') {
       echo 'Building...'     
    }
    stage('Deploy') {
       echo 'Deploying...'     
    }
}
*/