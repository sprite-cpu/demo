pipeline {
    agent any  // 어느 에이전트에서든 실행 가능
    tools {
        maven 'Maven 3.9.9'   // 위에서 지정한 이름
      }
    stages {
        stage('Java Version Check') {
            steps {
                bat 'java -version'
            }
        }
        stage('Checkout') {
            steps {
                git credentialsId: 'mykey', url: 'git@github.com:sprite-cpu/demo.git'
            }
        }
        stage('Extract Version') {
            steps {
                bat '''
                    @echo off
                                setlocal enabledelayedexpansion
                                for /f "delims=" %%a in ('findstr /i "<version>" pom.xml ^| findstr /v "<parent>" ^| findstr /v "<dependency>"') do (
                                    set "line=%%a"
                                )
                                call set "line=!line:*<version>=!"
                                call set "line=!line:</version>=!"
                                echo Project Version: !line!
                                echo VERSION=!line! > version.txt
                                endlocal
                '''
            }
        }
        stage('Build') {
            when {
                // 푸시된 변경 사항 중에 pom.xml 파일이 있으면 true
                changeset pattern: '**/pom.xml', comparator: 'GLOB'
                 }
              steps {
                bat 'mvn clean install'
              }
        }
        stage('Maven Test') {
            when {
                    changeset pattern: '**/pom.xml', comparator: 'GLOB'
                  }
              steps {
                bat 'mvn test'
              }
        }
        stage('Docker Build') {
            steps {
                script {
                    def version = readFile('version.txt').trim()
                    echo ' 도커 이미지 태그: ${version}'
                    def tag = "my-demo-app:${version}"
                    bat "docker build -t ${tag} ."
                }
            }
        }

        /*
   stage('Deploy') {
            steps {
                // 배포 명령어 실행
                bat 'mvn deploy'
            }
        } */
    }

    post {
        always {
            echo '빌드 후 작업이 완료되었습니다.'
        }
    }
}