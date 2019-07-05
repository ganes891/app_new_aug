node (label: 'slave1') {
  stage('SCM Checkout'){
       git credentialsId: 'gitlogin', url: 'https://github.com/ganes891/my-app'
   }
   stage('Mvn Package'){
     def mvnHome = tool name: 'maven-3', type: 'maven'
     def mvnCMD = "${mvnHome}"
     sh "${mvnCMD} clean package"
   }
   stage('Build Docker Image'){
     sh "sudo docker build -t ganesh891/devimage:${env.BUILD_ID} /tmp/workspace/tomcat-dev/."
   }
   stage('login to docker hub'){
        sh "sudo docker login -u ganesh891 -p ganesh-1"
   }
  stage('push image to hub docker'){
        sh "sudo docker push ganesh891/devimage:${env.BUILD_ID}"
   }
  stage('start the app service with 8080 port'){
        sh "sudo docker run -p 8080:8080 -d --name dev-tomcat ganesh891/devimage:${env.BUILD_ID}"
  mail (to: 'ganesan.kandasami@gmail.com',
         subject: "Job '${env.JOB_NAME}' (${env.BUILD_NUMBER}) is waiting for input",
         body: "Please go to ${env.BUILD_URL}.");
   input 'Ready to go?';   
   // continue on ...
   }
}
