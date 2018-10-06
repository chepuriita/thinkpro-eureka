pipeline {
  agent any
  tools { 
        maven 'Maven'
        jdk 'JAVA_HOME'
  }
  stages {
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace... */
      steps {
        checkout scm
      }
    }
    stage('Build') {
      steps {
        sh 'cd thinkpro-customer && mvn -B -DskipTests clean package'
        sh 'echo $USER'
        sh 'echo whoami'
      }
    }
    stage('Docker Build') {
      steps {
        sh 'cd thinkpro-eureka && /usr/bin/docker build -t satheeshch/thinkpro-eureka:latest .'
      }
    }
    stage('Push image') {
      steps {
        withDockerRegistry([credentialsId: 'docker-hub-credentials', url: "https://index.docker.io/v1/"]) {
          sh '/usr/bin/docker push satheeshch/thinkpro-eureka:latest'
        }
      }
    }
  }
}