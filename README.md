# Givers & Takers Platform (in-progress)

Welcome to the Givers & Takers platform, a community-driven space dedicated to transparent giving and tangible impact. Our platform connects donors and recipients for practical assistance, ensuring that every contribution makes a real difference.

![Givers & Takers Banner](./figures/homepage.png)

*Image inspiration from: [UNICEF](https://www.unicef.org), [Mirror Foundation](https://www.mirror.or.th), and [GoFundMe](https://www.gofundme.com).*

## Prerequisites

To run the platform locally, you will need Docker installed on your machine.

## Database Setup

The platform uses PostgreSQL as the database. Follow the steps below to start the database server.

1. Navigate to the `db` directory:

   ```bash
   cd db
   ```

2. Use Docker Compose to start the database:

   ```bash
   docker compose up -d
   ```

   The database server will be accessible at `http://localhost:5432`.

## Running the Backend - Rails App

1. Navigate to the `students` directory where the Rails application is located:

   ```bash
   cd backend
   ```

2. For the first-time setup, build the app image:

   ```bash
   docker compose build
   ```

3. Run the app:

   ```bash
   docker compose up -d
   ```

   The app will run on `http://localhost:3000`.

## Running the Frontend - React App

1. Navigate to the `frontend` directory:

   ```bash
   cd frontend
   ```

2. For the first-time setup, npm install:
   ```bash
   npm install
   ```

3. Run the app:
   ```bash
   ng serve
   ```

## Running the API - Express App

1. Navigate to the `api` directory:
   ```bash
   cd api
   ```

2. For the first-time setup, npm install:
   ```bash
   npm install
   ```

3. Run the app:
   ```bash
   npm run dev
   ```

### Accessing the App Container

To execute Rails commands (e.g., generating new models, running migrations), you’ll need to access the app container.

1. Open a terminal in the container:

   ```bash
   docker exec -it gnt-web bash
   ```

2. Exit the container when you're done:

   ```bash
   exit
   ```

## Stopping the Containers

To stop all running containers, go to the directory where the Docker Compose files are located and run:

```bash
docker compose down --remove-orphans
```

---

The platform encourages transparent giving and supports users who want to "Start Giving" with ease.