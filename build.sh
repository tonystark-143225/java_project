#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Children's Bank - Build & Deploy Script${NC}\n"

# Menu
echo "Select an option:"
echo "1. Build with Maven"
echo "2. Run with Maven (spring-boot:run)"
echo "3. Build Docker image"
echo "4. Run Docker container"
echo "5. Run with Docker Compose"
echo "6. Build and Run Docker image"
echo "7. Stop Docker container"
echo "8. Clean Maven build"

read -p "Enter your choice (1-8): " choice

case $choice in
  1)
    echo -e "${YELLOW}Building with Maven...${NC}"
    mvn clean package
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}✓ Build successful!${NC}"
    else
      echo -e "${RED}✗ Build failed!${NC}"
      exit 1
    fi
    ;;
  2)
    echo -e "${YELLOW}Running application with Maven...${NC}"
    mvn spring-boot:run
    ;;
  3)
    echo -e "${YELLOW}Building Docker image...${NC}"
    docker build -t children-bank:latest .
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}✓ Docker image built successfully!${NC}"
      docker images | grep children-bank
    else
      echo -e "${RED}✗ Docker build failed!${NC}"
      exit 1
    fi
    ;;
  4)
    echo -e "${YELLOW}Running Docker container...${NC}"
    docker run -d -p 8080:8080 --name children-bank children-bank:latest
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}✓ Docker container started!${NC}"
      echo "Access the application at: http://localhost:8080"
      sleep 2
      docker logs children-bank
    else
      echo -e "${RED}✗ Failed to start container!${NC}"
      exit 1
    fi
    ;;
  5)
    echo -e "${YELLOW}Running with Docker Compose...${NC}"
    docker-compose up -d
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}✓ Docker Compose started!${NC}"
      echo "Access the application at: http://localhost:8080"
      sleep 2
      docker-compose logs -f
    else
      echo -e "${RED}✗ Docker Compose failed!${NC}"
      exit 1
    fi
    ;;
  6)
    echo -e "${YELLOW}Building Maven package and Docker image...${NC}"
    mvn clean package && docker build -t children-bank:latest .
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}✓ Build successful! Running container...${NC}"
      docker run -d -p 8080:8080 --name children-bank children-bank:latest
      echo "Access the application at: http://localhost:8080"
    else
      echo -e "${RED}✗ Build failed!${NC}"
      exit 1
    fi
    ;;
  7)
    echo -e "${YELLOW}Stopping Docker container...${NC}"
    docker stop children-bank
    docker rm children-bank
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}✓ Container stopped and removed!${NC}"
    else
      echo -e "${YELLOW}Container may not be running.${NC}"
    fi
    ;;
  8)
    echo -e "${YELLOW}Cleaning Maven build...${NC}"
    mvn clean
    if [ $? -eq 0 ]; then
      echo -e "${GREEN}✓ Clean complete!${NC}"
    else
      echo -e "${RED}✗ Clean failed!${NC}"
      exit 1
    fi
    ;;
  *)
    echo -e "${RED}Invalid option!${NC}"
    exit 1
    ;;
esac
