# Simple Login Client

This is a React-based client application that connects to the login API at https://login.dnzaki.my.id

## Features

- Authentication system (login/logout)
- Dashboard with user information
- CRUD operations for various entities (users, roles, permissions, etc.)
- File management (PDFs, images)
- Interactive moodboards
- File conversion tools
- Admin panel for managing the system

## API Configuration

This application is configured to connect to the API at https://login.dnzaki.my.id. The API base URL can be configured using the `VITE_API_BASE_URL` environment variable.

## Development

To run the application locally for development:

```bash
npm install
npm run dev
```

## Building for Production

To build the application for production:

```bash
npm run build
```

## Testing

To run the test suite:

```bash
npm test
```

## Deployment

This application is ready for deployment on Vercel. The `vercel.json` configuration is included.

When deploying on Vercel, make sure to set the `VITE_API_BASE_URL` environment variable to your production API URL (https://login.dnzaki.my.id).

## Environment Variables

- `VITE_API_BASE_URL`: Base URL for the backend API (default: https://login.dnzaki.my.id)