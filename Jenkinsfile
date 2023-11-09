pipeline {    
    agent any
    stages { 
        stage('SCM') { 
            steps { 
                echo 'Gathering code from version control'     
            }
        }
         stage('Build') { 
            steps { 
                echo 'Building...'     
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
// example of declarative pipeline
// https://stackoverflow.com/questions/42113655/no-such-dsl-method-stages
// https://www.jenkins.io/doc/book/pipeline/syntax/
// https://www.jenkins.io/doc/book/pipeline/getting-started/
// https://www.edureka.co/community/74695/nosuchmethoderror-such-method-pipeline-found-among-steps
// https://stackoverflow.com/questions/8072700/how-to-restart-jenkins-manually
*/

/*
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