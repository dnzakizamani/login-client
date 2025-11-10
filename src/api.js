import axios from 'axios';

// Create an axios instance with default configuration
const api = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL || 'https://login.dnzaki.my.id', // Using Vite environment variable or fallback
  withCredentials: true, // Important for sending cookies
});

// Request interceptor to add any common headers
api.interceptors.request.use(
  (config) => {
    // Get token from localStorage and add to Authorization header if exists
    const token = localStorage.getItem('token');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// Response interceptor to handle responses globally if needed
api.interceptors.response.use(
  (response) => {
    return response;
  },
  (error) => {
    // Handle common error cases globally if needed
    return Promise.reject(error);
  }
);

export default api;