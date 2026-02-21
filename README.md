# Children's Bank Web Application

A simple Spring Boot web application for managing children's savings accounts with user authentication, admin controls, and individual user tracking.

## Features

- **User Authentication**: Login and logout functionality
- **Admin Dashboard**: Control all users and manage accounts
- **User Dashboard**: Track personal savings
- **In-Memory Data Storage**: Simple data persistence (can be replaced with a database)

## Prerequisites

- Java 11 or higher
- Maven 3.6+
- Docker (optional, for containerization)

## Running the Application

### Option 1: Run with Maven

1. **Clone/Navigate to the project directory**:
   ```bash
   cd d:\java_project
   ```

2. **Build the project**:
   ```bash
   mvn clean package
   ```

3. **Run the application**:
   ```bash
   mvn spring-boot:run
   ```

4. **Access the application**:
   - Open your browser and go to: `http://localhost:8080`
   - Login page will be displayed

### Option 2: Run the JAR directly

1. **Build the JAR file**:
   ```bash
   mvn clean package
   ```

2. **Run the JAR**:
   ```bash
   java -jar target/children-bank-0.1.0.jar
   ```

3. **Access the application**:
   - Open your browser and go to: `http://localhost:8080`

## Docker Deployment

### Build Docker Image

1. **Build the Docker image**:
   ```bash
   docker build -t children-bank:latest .
   ```

2. **Run the Docker container**:
   ```bash
   docker run -p 8080:8080 --name children-bank children-bank:latest
   ```

3. **Access the application**:
   - Open your browser and go to: `http://localhost:8080`

### Push to Registry (Optional)

To push the image to a Docker registry:

```bash
# Tag the image
docker tag children-bank:latest <your-registry>/children-bank:latest

# Push the image
docker push <your-registry>/children-bank:latest
```

## Default User Credentials

- **Admin User**:
  - Username: `admin`
  - Password: `admin123`

- **Regular User**:
  - Username: `user1`
  - Password: `user123`

## Project Structure

```
children-bank/
├── src/
│   └── main/
│       ├── java/com/example/childrenbank/
│       │   ├── ChildrenBankApplication.java
│       │   ├── controller/
│       │   │   └── AuthController.java
│       │   ├── model/
│       │   │   ├── Saving.java
│       │   │   └── User.java
│       │   ├── repository/
│       │   │   └── InMemoryUserRepository.java
│       │   └── service/
│       │       └── UserService.java
│       └── resources/
│           ├── templates/
│           │   ├── login.html
│           │   ├── dashboard.html
│           │   ├── admin.html
│           │   ├── user-savings.html
│           │   └── header.html
│           └── application.properties
├── pom.xml
├── Dockerfile
└── README.md
```

## Application Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/` | GET | Home page (redirects to login if not authenticated) |
| `/login` | GET/POST | User login |
| `/logout` | GET | User logout |
| `/dashboard` | GET | User dashboard |
| `/admin` | GET | Admin dashboard (admin only) |
| `/user/{username}/savings` | GET | View specific user's savings |

## Technology Stack

- **Framework**: Spring Boot 2.7.x
- **Templating**: Thymeleaf
- **Build Tool**: Maven
- **Java Version**: 11+
- **Container**: Docker

## Development Notes

- The application uses an in-memory repository, so data will be lost on restart
- To add persistent storage, replace `InMemoryUserRepository` with a JPA repository
- All templates are in `src/main/resources/templates/`

## Troubleshooting

- **Port 8080 already in use**: Change the port in `application.properties`:
  ```properties
  server.port=8081
  ```

- **Build fails**: Ensure Maven is installed:
  ```bash
  mvn -version
  ```

- **Docker image won't start**: Check logs:
  ```bash
  docker logs children-bank
  ```

## License

This project is open source and available under the MIT License.
