pipeline {
    // example of declarative pipeline
    // https://stackoverflow.com/questions/42113655/no-such-dsl-method-stages
    // https://www.jenkins.io/doc/book/pipeline/syntax/
    // https://www.jenkins.io/doc/book/pipeline/getting-started/
    agent any 1
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