const express = require('express');
const app = express();

app.use(express.json());

// Endpoint requerido para el Health Check del pipelinee
app.get('/health', (req, res) => {
    res.status(200).json({ 
        status: 'ok', 
        version: '1.0.0',
        timestamp: new Date().toISOString(),
        MessageEvent: 'Health check successful'
    });
});

// Ruta de ejemplo
app.get('/', (req, res) => {
    res.send('API funcionando correctamente en Docker 🐳');
});

module.exports = app;