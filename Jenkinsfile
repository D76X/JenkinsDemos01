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
                                 
                try {
                    echo 'Building...'
                    sh 'dotnet --version'                 
                    sh 'dotnet build ConsoleApp1'
                    echo 'Building new feature'                
                }
                catch(ex) {
                    
                    // this catch is not strikly necessary it is only to demo
                    // how to deal with exceptions in Groovy. Without a catch
                    // the build would fail.
                    // Jenkins also fails any step that runs a script that 
                    // retunrs a non zeor exit code i.e. a test stage.

                    echo 'Something went wrong'        
                    echo ex.ToString()

                    // this is not stricktly necessary but it gives the idea
                    // of how one may manually fail a step.
                    currentBuild.result = 'FAILURE'

                    // do not swallow the exception!
                    throw e
                }
                finally{
                    // do any cleanup..
                }               
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