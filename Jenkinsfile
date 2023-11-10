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
                //git branch: '${branch}', url:'https://github.com/D76X/JenkinsDemos01.git'
                git url:'https://github.com/D76X/JenkinsDemos01.git'
            }
        }
         stage('Build') { 
            steps { 
                echo 'Building...' 
                withDotNet(sdk: "sdk6") {
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