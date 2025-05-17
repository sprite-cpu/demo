# 1단계: JDK 17을 기반 이미지로 사용
FROM openjdk:17-jdk-alpine

# 2단계: JAR 파일 이름을 build할 때 전달받도록 함
ARG JAR_FILE=target/*.jar

# 3단계: JAR 파일을 컨테이너 안으로 복사
COPY ${JAR_FILE} app.jar

# 4단계: 앱 실행
ENTRYPOINT ["java", "-jar", "/app.jar"]
