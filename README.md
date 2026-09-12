Content Entertainment Platform — a Rails application that serves video content with a Like feature, primarily to learn realtime updates, concurrency, and high-load handling.

The core technical learning goal stays the same. We simply change Photo → Video/Content.

# Milestone 1 - Rails Foundation
Set up the Rails application and basic development environment.
Step 1 — Create Rails 8 Application
Create the Rails 8 application configured for PostgreSQL.

Step 2 — Dockerize Rails and PostgreSQL
Configure Docker Compose so both the Rails application and PostgreSQL run inside containers.

notes:
since we using docker-compose-dev.yml the custom file. to run the command docker compose must use -f

if file name docker-compose.yml commnand : docker compose up -d --build
if custom file name docker-compose-dev.yml command : docker compose -f docker-compose-dev.yml up -d --build

This step will include:
Rails web container
PostgreSQL database container
Dockerfile
compose.yml
PostgreSQL environment configuration
Rails database configuration
Environment variables
Rails ↔ PostgreSQL connection
Running Rails commands inside the container
Creating the development database
Verifying the application works entirely through Docker Compose

The target architecture will be:

Docker Compose
│
├── web
│   └── Rails 8
│
└── postgres
    └── PostgreSQL

And:
Browser
   │
   ▼
Rails container
   │
   │ PostgreSQL connection
   ▼
PostgreSQL container

Step 3 — Configure Tailwind CSS
Set up Tailwind CSS for the application's UI.
color palettes
DAFF7D
B2EF9B
8C86AA
81559B
7E3F8F

Step 4 — Create Application Layout
Create the common Rails layout and navigation structure.

Step 5 — Create Basic Home Page
Create the initial entertainment application home page.

Step 6 — Add Health Check
Add a simple health-check endpoint/page to verify the Rails application is running correctly.

# Milestone 2 - Entertainment Content CRUD
Build the basic content management functionality for video content.
Step 1: Create Content model
Step 2: Define content attributes
Step 3: Create content
Step 4: List contents
Step 5: Show content
Step 6: Edit content
Step 7: Delete content
Step 8: Display video content
Step 9: Improve content listing UI

# Milestone 3 - Basic Like System
Create the initial Like functionality and learn how a counter behaves under concurrent requests.
Step 1: Add like counter to Content
Step 2: Create Like button
Step 3: Increment like counter
Step 4: Display like counter
Step 5: Test multiple simultaneous likes
Step 6: Investigate race conditions
Step 7: Implement atomic counter increment
Step 8: Verify counter accuracy under concurrency

# Milestone 4 - Turbo Frame Interaction
Use Turbo Frames to make the Like interaction happen without a full-page refresh.
Step 1: Create Like Turbo Frame
Step 2: Submit Like through Turbo
Step 3: Replace Like counter with Turbo Frame
Step 4: Handle Like response
Step 5: Handle rapid Like requests
Step 6: Test multiple content items

# Milestone 5 - Realtime Like Updates
Introduce Turbo Streams and Action Cable so other connected users see Like counter changes immediately.
Step 1: Understand Turbo Stream broadcasting
Step 2: Configure Action Cable
Step 3: Connect browsers to realtime updates
Step 4: Broadcast Like counter changes
Step 5: Test with two browsers
Step 6: Test with multiple browsers
Step 7: Verify realtime synchronization

# Milestone 6 - PostgreSQL Concurrency
Deep dive into database concurrency and make the Like system reliable under heavy simultaneous requests.
Step 1: Understand concurrent database updates
Step 2: Reproduce counter race conditions
Step 3: Test concurrent Like requests
Step 4: Understand atomic updates
Step 5: Understand transactions
Step 6: Understand row locking
Step 7: Optimize the Like update
Step 8: Verify counter consistency

# Milestone 7 - Rails Concurrency and Puma
Learn how Rails handles many simultaneous requests.
Step 1: Understand Puma threads
Step 2: Understand Puma workers
Step 3: Test a single Rails process
Step 4: Test multiple threads
Step 5: Test multiple workers
Step 6: Understand Rails database connection pool
Step 7: Tune Rails concurrency
Step 8: Identify Rails bottlenecks

# Milestone 8 - Load Testing
Introduce a load-testing tool and establish performance measurements.
Step 1: Install k6
Step 2: Create Like load test
Step 3: Test 100 requests
Step 4: Test 1,000 requests
Step 5: Test 10,000 requests
Step 6: Measure requests per second
Step 7: Measure latency
Step 8: Measure p50, p95, and p99
Step 9: Measure error rate
Step 10: Monitor Rails and PostgreSQL

# Milestone 9 - High-Concurrency Testing
Push the application toward very large request volumes and identify the actual bottleneck.
Step 1: Test 100,000 requests
Step 2: Test 250,000 requests
Step 3: Test 500,000 requests
Step 4: Test 1 million total requests
Step 5: Test increasing requests per second
Step 6: Monitor PostgreSQL connections
Step 7: Monitor PostgreSQL CPU and locks
Step 8: Monitor Rails CPU and memory
Step 9: Identify the system bottleneck
Step 10: Optimize and retest

# Milestone 10 - Redis and Realtime Scaling
Introduce Redis and understand why it can become useful when scaling realtime applications.
Step 1: Introduce Redis
Step 2: Understand Redis Pub/Sub
Step 3: Integrate Redis with realtime communication
Step 4: Test realtime updates with Redis
Step 5: Compare PostgreSQL and Redis workloads
Step 6: Load test the Redis-based architecture
Step 7: Identify new bottlenecks

# Milestone 11 - Background Processing
Experiment with asynchronous processing and understand when queues are appropriate.
Step 1: Understand synchronous processing
Step 2: Understand asynchronous processing
Step 3: Introduce background jobs
Step 4: Introduce RabbitMQ
Step 5: Process Like-related work asynchronously
Step 6: Understand eventual consistency
Step 7: Compare synchronous and asynchronous approaches
Step 8: Load test both approaches

# Milestone 12 - Scaled Rails Architecture
Run multiple Rails instances and understand how a realtime application behaves when scaled horizontally.
Step 1: Run multiple Rails instances
Step 2: Introduce a load balancer
Step 3: Distribute requests between Rails instances
Step 4: Configure shared realtime communication
Step 5: Connect multiple browsers
Step 6: Test realtime updates across instances
Step 7: Load test the scaled architecture
Step 8: Identify the new bottleneck
Final Architecture Goal

Eventually, we'll be able to experiment with an architecture like:

                    Load Test
                        │
                        ▼
                 Load Balancer
                        │
             ┌──────────┼──────────┐
             ▼          ▼          ▼
          Rails 1    Rails 2    Rails 3
             │          │          │
             └──────────┼──────────┘
                        │
              ┌─────────┴─────────┐
              ▼                   ▼
         PostgreSQL             Redis
              │                   │
              │             Realtime
              │             communication
              │                   │
              └─────────┬─────────┘
                        ▼
                    Browsers
                        │
                        ▼
                 Video Content
                  ❤️ Likes
