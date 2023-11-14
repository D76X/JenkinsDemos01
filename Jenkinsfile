// Example of a Declarative Pipeline
// Pipeline Steps Reference 
// https://www.jenkins.io/doc/pipeline/steps/ 

// Important: 
// make sure that if you create a Jenkinsfile on Windows the encoding is NOT UTF-8 BOM (Byte Order Mark) 
// this file must be UTF-8 for Jenkins to be able to parse it appropriately.
// https://stackoverflow.com/questions/50718320/java-lang-nosuchmethoderror-no-such-dsl-method-pipeline-found-when-running

// Pipeline: Basic Steps
// https://www.jenkins.io/doc/pipeline/steps/workflow-basic-steps/#pipeline-basic-steps

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

                // this is how you may embed scripted steps into a declarative pipeline
                // it also illustrate how to hadle exceptions and finally clauses.
                // https://stackoverflow.com/questions/42718785/how-to-throw-exception-in-jenkins-pipeline
                script {
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
            post {
                success {
                    script {
                        echo "Build step success"
                    }
                }
                failure {
                    script {
                        echo "Build step failure"
                    }
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
       
       // use try catch in a scripted pipeline!
       // https://stackoverflow.com/questions/44003788/try-catch-block-in-jenkins-pipeline-script#:~:text=try%2Fcatch%20is%20scripted%20syntax,inside%20stage%20%3Esteps%20%3Escript.

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
    stage('Deploy') {
       echo 'Deploying...'     
    }
}
*/