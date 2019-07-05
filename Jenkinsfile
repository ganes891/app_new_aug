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
        sh "sudo docker run -p 8080:8080 -d --name dev-tomcat_v1 ganesh891/devimage:${env.BUILD_ID}"
         body: "Please go to ${env.BUILD_URL}.");
         body: "Please go to ${env.BUILD_URL}.");
environment {
            EMAIL_TO = 'ganesan.kandasami@gmail.com'
        }
    post {
            failure {
                emailext body: 'Check console output at $BUILD_URL to view the results. \n\n ${CHANGES} \n\n -------------------------------------------------- \n${BUILD_LOG, maxLines=100, escapeHtml=false}', 
                        to: EMAIL_TO, 
                        subject: 'Build failed in Jenkins: $PROJECT_NAME - #$BUILD_NUMBER'
            }
            unstable {
                emailext body: 'Check console output at $BUILD_URL to view the results. \n\n ${CHANGES} \n\n -------------------------------------------------- \n${BUILD_LOG, maxLines=100, escapeHtml=false}', 
                        to: EMAIL_TO, 
                        subject: 'Unstable build in Jenkins: $PROJECT_NAME - #$BUILD_NUMBER'
            }
            changed {
                emailext body: 'Check console output at $BUILD_URL to view the results.', 
                        to: EMAIL_TO, 
                        subject: 'Jenkins build is back to normal: $PROJECT_NAME - #$BUILD_NUMBER'
            }
        }
	}
}
