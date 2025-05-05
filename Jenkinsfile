pipeline {
    agent any  // 어느 에이전트에서든 실행 가능

    stages {
        stage('Build') {
            steps {
                // Maven 빌드 실행
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                // 테스트 실행
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                // 배포 명령어 실행 (예시)
                sh 'mvn deploy'
            }
        }
    }

    post {
        always {
            // 빌드 후 처리, 예: 빌드 결과를 이메일로 발송
            echo '빌드 후 작업이 완료되었습니다.'
        }
    }
}