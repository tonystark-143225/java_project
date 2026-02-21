# Children's Bank - Deployment Guide

This guide provides detailed instructions for deploying the Children's Bank application using Maven and Docker.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Maven Deployment](#maven-deployment)
3. [Docker Deployment](#docker-deployment)
4. [Docker Compose Deployment](#docker-compose-deployment)
5. [Troubleshooting](#troubleshooting)

---

## Prerequisites

Ensure you have the following installed:

- **Java**: JDK 11 or higher
  ```bash
  java -version
  ```

- **Maven**: 3.6 or higher
  ```bash
  mvn -version
  ```

- **Docker** (optional, for containerization): 20.10+
  ```bash
  docker --version
  ```

- **Git** (optional, for version control)
  ```bash
  git --version
  ```

---

## Maven Deployment

Maven is a build automation tool that handles compilation, testing, and packaging of Java applications.

### Step 1: Navigate to Project Directory

```bash
cd d:\java_project
```

### Step 2: Build the Project

The `clean` command removes any previous builds, and `package` creates the JAR file.

```bash
mvn clean package
```

**Output**: A JAR file will be created at `target/children-bank-0.1.0.jar`

### Step 3: Run the Application

#### Option A: Using Maven Plugin (Recommended for Development)

```bash
mvn spring-boot:run
```

This starts the application and automatically recompiles on file changes (with IDE support).

**Output**:
```
2026-02-21 10:00:00.000  INFO [main] Application started
Tomcat started on port(s): 8080 (http)
```

#### Option B: Using Java Directly (Production)

```bash
java -jar target/children-bank-0.1.0.jar
```

### Step 4: Access the Application

Open your browser and navigate to:
```
http://localhost:8080
```

You'll be redirected to the login page.

### Maven Commands Reference

| Command | Purpose |
|---------|---------|
| `mvn clean` | Remove build artifacts |
| `mvn compile` | Compile source code only |
| `mvn test` | Run unit tests |
| `mvn package` | Create JAR/WAR file |
| `mvn install` | Install JAR to local .m2 repository |
| `mvn spring-boot:run` | Run the application directly |
| `mvn dependency:tree` | View dependency tree |

---

## Docker Deployment

Docker containerizes the application for consistent deployment across environments.

### Step 1: Build the Docker Image

The Dockerfile uses a multi-stage build for optimization:

```bash
docker build -t children-bank:latest .
```

**Options**:
- `-t children-bank:latest`: Tags the image as "children-bank" with version "latest"
- `.`: Builds from the current directory (Dockerfile location)

**Output**:
```
Successfully built abc123def456
Successfully tagged children-bank:latest
```

### Step 2: Verify the Image

```bash
docker images | grep children-bank
```

**Output**:
```
REPOSITORY      TAG       IMAGE ID         CREATED          SIZE
children-bank   latest    abc123def456     2 minutes ago    280MB
```

### Step 3: Run the Docker Container

```bash
docker run -d -p 8080:8080 --name children-bank children-bank:latest
```

**Options**:
- `-d`: Run in detached mode (background)
- `-p 8080:8080`: Map port 8080 (container) to 8080 (host)
- `--name children-bank`: Assign container name
- `children-bank:latest`: Image to run

### Step 4: Verify Container is Running

```bash
docker ps
```

**Output**:
```
CONTAINER ID   IMAGE                COMMAND                 STATUS
abc123def456   children-bank:latest "sh -c 'java $JAVA_O…" Up 2 minutes
```

### Step 5: View Application Logs

```bash
docker logs children-bank
```

### Step 6: Access the Application

Open your browser and navigate to:
```
http://localhost:8080
```

### Useful Docker Commands

| Command | Purpose |
|---------|---------|
| `docker build -t children-bank:latest .` | Build the image |
| `docker run -d -p 8080:8080 --name children-bank children-bank:latest` | Run container |
| `docker ps` | List running containers |
| `docker logs children-bank` | View container logs |
| `docker stop children-bank` | Stop container |
| `docker rm children-bank` | Remove container |
| `docker images` | List all images |
| `docker rmi children-bank:latest` | Remove image |

### Stopping and Removing Container

```bash
# Stop the container
docker stop children-bank

# Remove the container
docker rm children-bank
```

---

## Docker Compose Deployment

Docker Compose simplifies running multi-container applications with a single file.

### Step 1: Prepare Docker Compose File

The `docker-compose.yml` file is already included. It contains:

```yaml
version: '3.8'
services:
  children-bank:
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - "8080:8080"
    environment:
      - JAVA_OPTS=-Xmx512m -Xms256m
    restart: unless-stopped
```

### Step 2: Start Services

```bash
docker-compose up -d
```

**Output**:
```
Creating network "project_default" with the default driver
Building children-bank
...
Creating children-bank-app ... done
```

### Step 3: Verify Services

```bash
docker-compose ps
```

### Step 4: View Logs

```bash
docker-compose logs -f
```

### Step 5: Access the Application

```
http://localhost:8080
```

### Docker Compose Commands

| Command | Purpose |
|---------|---------|
| `docker-compose up -d` | Start services in background |
| `docker-compose ps` | List running services |
| `docker-compose logs -f` | View and follow logs |
| `docker-compose stop` | Stop services |
| `docker-compose down` | Stop and remove services |
| `docker-compose restart` | Restart services |

---

## Pushing to Docker Registry

### Option 1: Docker Hub

1. **Create a Docker Hub account**: https://hub.docker.com

2. **Login to Docker**:
   ```bash
   docker login
   ```

3. **Tag the image**:
   ```bash
   docker tag children-bank:latest <username>/children-bank:latest
   ```

4. **Push the image**:
   ```bash
   docker push <username>/children-bank:latest
   ```

5. **Pull and run elsewhere**:
   ```bash
   docker run -d -p 8080:8080 <username>/children-bank:latest
   ```

### Option 2: Private Registry

1. **Tag for your registry**:
   ```bash
   docker tag children-bank:latest your-registry.com/children-bank:latest
   ```

2. **Push to registry**:
   ```bash
   docker push your-registry.com/children-bank:latest
   ```

---

## Configuration

### Environment Variables

You can customize the application using environment variables:

```bash
# Using Docker
docker run -d \
  -p 8080:8080 \
  -e JAVA_OPTS="-Xmx1024m -Xms512m" \
  -e SERVER_PORT=8081 \
  --name children-bank \
  children-bank:latest
```

```bash
# Using Docker Compose (add to docker-compose.yml)
environment:
  - JAVA_OPTS=-Xmx1024m -Xms512m
  - SERVER_PORT=8081
```

### Application Properties

Modify `src/main/resources/application.properties`:

```properties
# Server Configuration
server.port=8080
spring.application.name=children-bank

# Database Configuration (if using database)
spring.datasource.url=jdbc:mysql://localhost:3306/children_bank
spring.datasource.username=root
spring.datasource.password=password

# JPA Configuration
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=false
```

---

## Performance Tuning

### Java Memory Settings

For production, adjust JVM memory in the Dockerfile or docker-compose:

```bash
# Small deployment (512MB)
-Xmx512m -Xms256m
```

```bash
# Medium deployment (1GB)
-Xmx1024m -Xms512m
```

```bash
# Large deployment (2GB+)
-Xmx2048m -Xms1024m
```

---

## Troubleshooting

### Issue: Port 8080 Already in Use

**Solution 1: Use different port**
```bash
docker run -d -p 8081:8080 --name children-bank children-bank:latest
```

**Solution 2: Stop conflicting service**
```bash
# Find process on port 8080
netstat -ano | findstr :8080  # Windows
lsof -i :8080                 # macOS/Linux

# Kill the process
taskkill /PID <PID> /F        # Windows
kill -9 <PID>                 # macOS/Linux
```

### Issue: Docker Image Build Fails

**Check error messages**:
```bash
docker build -t children-bank:latest . 2>&1 | tee build.log
```

**Common causes**:
- Maven not installed
- Java version mismatch
- Network issues downloading dependencies

### Issue: Container Won't Start

**View logs**:
```bash
docker logs children-bank
```

**Check if port is mapped correctly**:
```bash
docker ps
```

**Verify application.properties** is correct for your environment.

### Issue: Application Runs Slow

**Check resource usage**:
```bash
docker stats children-bank
```

**Increase allocated memory** in docker-compose.yml or run command.

### Issue: Connection Refused

**Verify container is running**:
```bash
docker ps | grep children-bank
```

**Check if application started successfully**:
```bash
docker logs children-bank | grep "started"
```

**Try accessing from container**:
```bash
docker exec children-bank curl http://localhost:8080/login
```

---

## Quick Start Scripts

We've provided helper scripts for easy deployment:

### Windows (build.bat)
```cmd
build.bat
```

### macOS/Linux (build.sh)
```bash
chmod +x build.sh
./build.sh
```

These scripts provide an interactive menu for common tasks.

---

## Summary

| Method | Best For | Command |
|--------|----------|---------|
| Maven | Development | `mvn spring-boot:run` |
| JAR | Testing | `java -jar target/children-bank-0.1.0.jar` |
| Docker | Isolation | `docker run -p 8080:8080 children-bank:latest` |
| Docker Compose | Multi-environment | `docker-compose up -d` |

For more information, visit:
- [Spring Boot Documentation](https://spring.io/projects/spring-boot)
- [Docker Documentation](https://docs.docker.com/)
- [Maven Documentation](https://maven.apache.org/guides/)
