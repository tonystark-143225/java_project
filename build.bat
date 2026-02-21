@echo off
setlocal enabledelayedexpansion

echo ============================================
echo Children's Bank - Build and Deploy Script
echo ============================================
echo.

echo Select an option:
echo 1. Build with Maven
echo 2. Run with Maven (spring-boot:run)
echo 3. Build Docker image
echo 4. Run Docker container
echo 5. Run with Docker Compose
echo 6. Build and Run Docker image
echo 7. Stop Docker container
echo 8. Clean Maven build

set /p choice="Enter your choice (1-8): "

if "%choice%"=="1" (
    echo Building with Maven...
    call mvn clean package
    if !errorlevel! equ 0 (
        echo.
        echo [SUCCESS] Build successful!
    ) else (
        echo.
        echo [ERROR] Build failed!
        exit /b 1
    )
) else if "%choice%"=="2" (
    echo Running application with Maven...
    call mvn spring-boot:run
) else if "%choice%"=="3" (
    echo Building Docker image...
    docker build -t children-bank:latest .
    if !errorlevel! equ 0 (
        echo.
        echo [SUCCESS] Docker image built successfully!
        docker images | find "children-bank"
    ) else (
        echo.
        echo [ERROR] Docker build failed!
        exit /b 1
    )
) else if "%choice%"=="4" (
    echo Running Docker container...
    docker run -d -p 8080:8080 --name children-bank children-bank:latest
    if !errorlevel! equ 0 (
        echo.
        echo [SUCCESS] Docker container started!
        echo Access the application at: http://localhost:8080
        timeout /t 2 /nobreak
        docker logs children-bank
    ) else (
        echo.
        echo [ERROR] Failed to start container!
        exit /b 1
    )
) else if "%choice%"=="5" (
    echo Running with Docker Compose...
    docker-compose up -d
    if !errorlevel! equ 0 (
        echo.
        echo [SUCCESS] Docker Compose started!
        echo Access the application at: http://localhost:8080
        timeout /t 2 /nobreak
        docker-compose logs -f
    ) else (
        echo.
        echo [ERROR] Docker Compose failed!
        exit /b 1
    )
) else if "%choice%"=="6" (
    echo Building Maven package and Docker image...
    call mvn clean package
    if !errorlevel! equ 0 (
        docker build -t children-bank:latest .
        if !errorlevel! equ 0 (
            echo.
            echo [SUCCESS] Build successful! Running container...
            docker run -d -p 8080:8080 --name children-bank children-bank:latest
            echo Access the application at: http://localhost:8080
        ) else (
            echo [ERROR] Docker build failed!
            exit /b 1
        )
    ) else (
        echo [ERROR] Maven build failed!
        exit /b 1
    )
) else if "%choice%"=="7" (
    echo Stopping Docker container...
    docker stop children-bank
    docker rm children-bank
    if !errorlevel! equ 0 (
        echo.
        echo [SUCCESS] Container stopped and removed!
    ) else (
        echo [WARNING] Container may not be running.
    )
) else if "%choice%"=="8" (
    echo Cleaning Maven build...
    call mvn clean
    if !errorlevel! equ 0 (
        echo.
        echo [SUCCESS] Clean complete!
    ) else (
        echo [ERROR] Clean failed!
        exit /b 1
    )
) else (
    echo [ERROR] Invalid option!
    exit /b 1
)

echo.
pause
