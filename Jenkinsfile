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
     def myimage = docker.build("ganesh891/devimage${env.BUILD_ID}", "./tmp/workspace/tomcat-dev")}
   }
   stage('Push Docker Image'){
     withCredentials([string(credentialsId: 'dockerlogin', variable: 'dockerHubPwd')]) {
        sh "docker login -u ganesh891 -p ${dockerHubPwd}"
        sh "docker push ganesh891/devimage${env.BUILD_ID}"
	sh "docker run -p 8080:8080 -d --name my-app ganesh891/devimage:${env.BUILD_ID}"
   }
}

