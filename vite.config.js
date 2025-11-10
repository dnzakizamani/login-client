import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  build: {
    outDir: 'dist',
    // sourcemap: true,
    // minify: 'terser',
    // rollupOptions: {
    //   output: {
    //     manualChunks: {
    //       'react-vendor': ['react', 'react-dom'],
    //       'router-vendor': ['react-router-dom'],
    //       'ui-vendor': ['react-icons', 'react-toastify'],
    //       'pdf-vendor': ['react-pdf', 'pdfjs-dist']
    //     }
    //   }
    // }
  }
})
